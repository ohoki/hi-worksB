package com.worksb.hi.security;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;

import com.worksb.hi.company.mapper.CompanyMapper;
import com.worksb.hi.company.service.CompanyVO;
import com.worksb.hi.member.mapper.MemberMapper;
import com.worksb.hi.member.service.MemberService;
import com.worksb.hi.member.service.MemberVO;
import com.worksb.hi.member.service.impl.MemberServiceImpl;

public class CustomLoginSuccessHandler implements AuthenticationSuccessHandler{
	
	@Autowired
	MemberMapper memberMapper;
	@Autowired
	CompanyMapper companyMapper;
	
	@Override
	public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response,
			Authentication authentication) throws IOException, ServletException {
		
		//멤버찾기
		MemberVO member = new MemberVO();
		member.setMemberId(authentication.getName());
		
		member = memberMapper.selectMember(member);
		
		if(member.getCompanyId() != null) {
			//회사찾기
			CompanyVO company = new CompanyVO();
			company.setCompanyId(member.getCompanyId());
			company = companyMapper.getCompanyById(company);
			
			request.getSession().setAttribute("companyInfo", company);
		}
		
		request.getSession().setAttribute("memberInfo", member);
		
		response.sendRedirect("start");
	}
}
