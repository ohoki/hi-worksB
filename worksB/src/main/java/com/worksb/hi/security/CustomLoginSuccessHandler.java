package com.worksb.hi.security;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;

import com.worksb.hi.member.mapper.MemberMapper;
import com.worksb.hi.member.service.MemberService;
import com.worksb.hi.member.service.MemberVO;
import com.worksb.hi.member.service.impl.MemberServiceImpl;

public class CustomLoginSuccessHandler implements AuthenticationSuccessHandler{
	
	@Autowired
	MemberMapper memberMapper;
	
	@Override
	public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response,
			Authentication authentication) throws IOException, ServletException {
		
		MemberVO member = new MemberVO();
		member.setMemberId(authentication.getName());
		
		member = memberMapper.selectMember(member);
			
		request.getSession().setAttribute("memberId", authentication.getName());
		request.getSession().setAttribute("companyId", member.getCompanyId());
		
		response.sendRedirect("start");
	}

}
