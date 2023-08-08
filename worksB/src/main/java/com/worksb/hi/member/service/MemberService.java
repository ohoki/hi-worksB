package com.worksb.hi.member.service;

public interface MemberService {
	//단건조회
	public MemberVO selectMember(MemberVO memberVO);
	
	//회원가입
	public int insertMemberInfo(MemberVO memberVO);
}
