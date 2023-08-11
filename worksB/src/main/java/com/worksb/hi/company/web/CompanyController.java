package com.worksb.hi.company.web;

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
import org.springframework.web.bind.annotation.RequestPart;
import org.springframework.web.multipart.MultipartFile;

import com.worksb.hi.company.service.CompanyService;
import com.worksb.hi.company.service.CompanyVO;
import com.worksb.hi.member.service.MemberService;
import com.worksb.hi.member.service.MemberVO;

@Controller
public class CompanyController {
	
	@Value("${file.upload.path}")
	private String uploadPath;
	
	
	@Autowired
	CompanyService companyService;
	
	@Autowired
	MemberService memberService;
	
	//회사정보 등록
	@PostMapping("/insertCompany")
	public String insertCompnay(CompanyVO companyVO, @RequestPart MultipartFile logo, HttpSession session, Model model) {
		CompanyVO dbCompany = companyService.getCompanyByUrl(companyVO);
		String message = null;
		
		if(dbCompany != null) {
			message = "이미 존재하는 회사 url 입니다. 다시 입력해 주세요.";
			model.addAttribute("message", message);
			
			return "member/companyRegisterForm";
		} 
		
		String originalName = logo.getOriginalFilename();	
		String fileName = originalName.substring(originalName.lastIndexOf("//")+1);
		String folderPath = makeFolder();
		String uuid = UUID.randomUUID().toString();
		String uploadFileName = folderPath + File.separator + uuid + "_" + fileName;
		String saveName = uploadPath + File.separator + uploadFileName;
		Path savePath = Paths.get(saveName);
		
		try {
			logo.transferTo(savePath);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		companyVO.setLogoPath(fileName);
		companyVO.setRealLogoPath(setImagePath(uploadFileName));
		
		companyService.insertCompany(companyVO);
		
		MemberVO member = new MemberVO();
		member.setMemberId((String)session.getAttribute("memberId"));
		member.setCompanyId(companyVO.getCompanyId());
		
		memberService.updateMember(member);
		
		session.setAttribute("companyId", member.getCompanyId());
		
		return "company/companyMain";
	}//insertCompnay
	
	//폴더생성
	private String makeFolder() {
		String str = LocalDate.now().format(DateTimeFormatter.ofPattern("yyyy/MM/dd"));
		
		String folderPath = str.replace("/", File.separator);
		File uploadPathFolder = new File(uploadPath, folderPath);
		
		if(uploadPathFolder.exists() == false) {
			uploadPathFolder.mkdirs();
		}
		
		return folderPath;
	}
	
	private String setImagePath(String uploadFileName) {
		return uploadFileName.replace(File.separator, "/");
	}
}
