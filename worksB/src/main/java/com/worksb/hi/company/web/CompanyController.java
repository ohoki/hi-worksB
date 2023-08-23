package com.worksb.hi.company.web;

import java.io.File;
import java.io.IOException;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.HashMap;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestPart;
import org.springframework.web.bind.annotation.ResponseBody;
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
	@PostMapping("/member/insertCompany")
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
		
		MemberVO member = (MemberVO)session.getAttribute("memberInfo");
		member.setCompanyId(companyVO.getCompanyId());
		member.setCompanyAccp("A1");
		member.setMemberGrade("H1");
		
		memberService.updateMember(member);
		
		session.setAttribute("companyId", member.getCompanyId());
		
		return "redirect:/start";
	}//insertCompnay
	
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
	
	//회사 참여
	@PostMapping("/member/practiceCompany")
	public String practiceCompany(CompanyVO companyVO, HttpSession session) {
		CompanyVO dbCompany = companyService.getCompanyByUrl(companyVO);
		MemberVO member = new MemberVO();
		member.setMemberId((String)session.getAttribute("memberId"));
		member.setCompanyId(dbCompany.getCompanyId());
		// 관리자 승인여부 확인
		if("A1".equals(dbCompany.getAdmAccp())) { 
			member.setCompanyAccp("A2");
		} else {
			member.setCompanyAccp("A1");
		}
		memberService.updateMember(member);
		session.setAttribute("companyId", dbCompany.getCompanyId());
		return "redirect:/start";
	}
	
	@RequestMapping(value="/ckuploadsAjax")
	@ResponseBody
	public Map<String, Object> image(@RequestPart MultipartFile[] upload, HttpServletRequest request) throws Exception{
		
		Map<String, Object> mv = new HashMap<>();

		 for(MultipartFile uploadFile : upload){
		    	if(uploadFile.getContentType().startsWith("image") == false){
		    		System.err.println("this file is not image type");
		    		return null;
		        }
		  
		        String originalName = uploadFile.getOriginalFilename();
		        String fileName = originalName.substring(originalName.lastIndexOf("//")+1);
		        
		        System.out.println("fileName : " + fileName);
		    
		        //날짜 폴더 생성
		        String folderPath = makeFolder();
		        //UUID
		        String uuid = UUID.randomUUID().toString();
		        //저장할 파일 이름 중간에 "_"를 이용하여 구분
		        
		        String uploadFileName = folderPath +File.separator + uuid + "_" + fileName;
		        
		        String saveName = uploadPath + File.separator + uploadFileName;
		        
		        Path savePath = Paths.get(saveName);
		        //Paths.get() 메서드는 특정 경로의 파일 정보를 가져옵니다.(경로 정의하기)
		        System.out.println("path : " + saveName);
		        try{
		        	uploadFile.transferTo(savePath);
		            //uploadFile에 파일을 업로드 하는 메서드 transferTo(file)
		        } catch (IOException e) {
		             e.printStackTrace();	             
		        }
		   
		        mv.put("uploaded", true);
		        mv.put("url", request.getContextPath()+"/images/" + setImagePath(uploadFileName));
		}

	    return mv;
	}
}
