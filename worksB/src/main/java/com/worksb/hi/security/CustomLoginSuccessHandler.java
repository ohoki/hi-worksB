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
import com.worksb.hi.member.service.MemberVO;

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
		member.setEmpStatus("S1");
		memberMapper.updateMember(member);
		
		member = memberMapper.selectMember(member);
		
		if(member.getCompanyId() != null) {
			//회사찾기
			CompanyVO company = new CompanyVO();
			company.setCompanyId(member.getCompanyId());
			company = companyMapper.getCompanyById(company);
			
			request.getSession().setAttribute("companyInfo", company);
		}
		request.getSession().setAttribute("memberInfo", member);
		//세션 시간 설정
		request.getSession().setMaxInactiveInterval(60*20);
		
		response.sendRedirect("start");
	}
}
