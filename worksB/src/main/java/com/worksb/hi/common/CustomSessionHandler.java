package com.worksb.hi.common;

import javax.servlet.annotation.WebListener;
import javax.servlet.http.HttpSession;
import javax.servlet.http.HttpSessionEvent;
import javax.servlet.http.HttpSessionListener;

import org.springframework.web.context.WebApplicationContext;
import org.springframework.web.context.support.WebApplicationContextUtils;

import com.worksb.hi.member.mapper.MemberMapper;
import com.worksb.hi.member.service.MemberVO;

@WebListener
public class CustomSessionHandler implements HttpSessionListener {

	@Override
	public void sessionCreated(HttpSessionEvent se) {
		// TODO Auto-generated method stub
	}

	@Override
	public void sessionDestroyed(HttpSessionEvent se) {
		HttpSession session = se.getSession();
		
		WebApplicationContext ctx = WebApplicationContextUtils.getWebApplicationContext(session.getServletContext());
		MemberMapper memberMapper = (MemberMapper)ctx.getBean(MemberMapper.class);
		
		//접속상태 수정
		MemberVO member = new MemberVO();
		if((MemberVO)session.getAttribute("memberInfo") != null) {
			member.setMemberId(((MemberVO)session.getAttribute("memberInfo")).getMemberId());
			member.setEmpStatus("S3");
			
			memberMapper.updateMember(member);
		}
	}
}
