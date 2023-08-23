package com.worksb.hi.security;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.web.authentication.logout.LogoutSuccessHandler;

import com.worksb.hi.member.mapper.MemberMapper;
import com.worksb.hi.member.service.MemberVO;

public class CustomLogoutSuccessHandler implements LogoutSuccessHandler{
	
	@Autowired
	MemberMapper memberMapper;
	
	@Override
	public void onLogoutSuccess(HttpServletRequest request, HttpServletResponse response, Authentication authentication)
			throws IOException, ServletException {
		//접속상태 수정
		MemberVO member = new MemberVO();
		member.setMemberId(authentication.getName());
		member.setEmpStatus("S3");
		memberMapper.updateMember(member);
		
		response.sendRedirect("loginForm");
	}
}

