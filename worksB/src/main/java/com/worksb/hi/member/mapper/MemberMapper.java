package com.worksb.hi.member.mapper;

import com.worksb.hi.member.service.MemberVO;

public interface MemberMapper {
	//단건조회
	public MemberVO selectMember(MemberVO memberVO);
	
	//회원가입
	public int inserMemberInfo(MemberVO memberVO);
}
