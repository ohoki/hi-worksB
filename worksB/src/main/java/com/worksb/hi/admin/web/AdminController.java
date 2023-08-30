package com.worksb.hi.admin.web;

import java.io.File;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.UUID;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestPart;
import org.springframework.web.multipart.MultipartFile;

import com.worksb.hi.admin.service.AdminService;
import com.worksb.hi.company.service.CompanyService;
import com.worksb.hi.company.service.CompanyVO;
import com.worksb.hi.member.service.MemberService;
import com.worksb.hi.member.service.MemberVO;
@RequestMapping("/admin")
@Controller
public class AdminController {
	@Value("${file.upload.path}")
	private String uploadPath;
	
	@Autowired
	CompanyService companyService;
	@Autowired
	MemberService memberService;
	@Autowired
	AdminService adminservice;
	
	
	
	@RequestMapping("/companyInfo")
	public String companyInfo() {
		return "admin/companyInfo";
	}
	
	
	@PostMapping("/updateCompany")
	public String updateCompany(CompanyVO companyVO, @RequestPart MultipartFile logo, HttpSession session, Model model) {
		CompanyVO dbCompany = companyService.getCompanyByUrl(companyVO);
		String message = null;
		
		if(dbCompany != null) {
			message = "이미 존재하는 회사 url 입니다. 다시 입력해 주세요.";
			model.addAttribute("message", message);
			
			return "/companyInfo";
		} 
		
		String originalName = logo.getOriginalFilename();	
		System.out.println(originalName+"originalName");
		String fileName = originalName.substring(originalName.lastIndexOf("//")+1);
		System.out.println(fileName+"fileName");
		String folderPath = makeFolder();
		System.out.println(folderPath+"folderPath");
		String uuid = UUID.randomUUID().toString();
		System.out.println(uuid+"uuid");
		String uploadFileName = folderPath + File.separator + uuid + "_" + fileName;
		System.out.println(uploadFileName+"uploadFileName");
		String saveName = uploadPath + File.separator + uploadFileName;
		System.out.println(saveName+"saveName");
		Path savePath = Paths.get(saveName);
		System.out.println(savePath+"savePath");
		
		try {
			logo.transferTo(savePath);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		companyVO.setLogoPath(fileName);
		companyVO.setRealLogoPath(setImagePath(uploadFileName));
		
		companyService.insertCompany(companyVO);
		
		MemberVO member = (MemberVO)session.getAttribute("memberInfo");
		member.setCompanyId(companyVO.getCompanyId());
		member.setCompanyAccp("A1");
		member.setMemberGrade("H1");
		
		memberService.updateMember(member);
		
		session.setAttribute("companyId", member.getCompanyId());
		
		return "/companyInfo";
	}
	//폴더생성
		public String makeFolder() {
			String str = LocalDate.now().format(DateTimeFormatter.ofPattern("yyyy/MM/dd"));
			
			String folderPath = str.replace("/", File.separator);
			File uploadPathFolder = new File(uploadPath, folderPath);
			
			if(uploadPathFolder.exists() == false) {
				uploadPathFolder.mkdirs();
			}
			
			return folderPath;
		}
		public String setImagePath(String uploadFileName) {
			return uploadFileName.replace(File.separator, "/");
		}
		
		@RequestMapping("/downloadlist")
		public String downloaded(Model m,HttpSession session) {
			Integer companyId=((CompanyVO)session.getAttribute("companyInfo")).getCompanyId();
			m.addAttribute("list",adminservice.downloadList(companyId));
			return "admin/downloadedfile";
		}

}
