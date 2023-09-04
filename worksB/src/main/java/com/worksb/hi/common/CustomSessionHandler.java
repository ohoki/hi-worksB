package com.worksb.hi.common;

import javax.servlet.http.HttpSession;
import javax.servlet.http.HttpSessionEvent;
import javax.servlet.http.HttpSessionListener;

import org.springframework.beans.factory.annotation.Autowired;

import com.worksb.hi.member.mapper.MemberMapper;
import com.worksb.hi.member.service.MemberService;
import com.worksb.hi.member.service.MemberVO;

public class CustomSessionHandler implements HttpSessionListener {
	
	@Autowired
	MemberMapper memberMapper;
	
	@Override
	public void sessionCreated(HttpSessionEvent se) {
		// TODO Auto-generated method stub
	}

	@Override
	public void sessionDestroyed(HttpSessionEvent se) {
		HttpSession session = se.getSession();
		
		//접속상태 수정
		MemberVO member = new MemberVO();
		member.setMemberId(((MemberVO)session.getAttribute("memberInfo")).getMemberId());
		member.setEmpStatus("S3");

		System.out.println(member);
		
		memberMapper.updateMember(member);
	}
}
