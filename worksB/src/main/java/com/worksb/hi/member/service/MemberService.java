package com.worksb.hi.member.service;


public interface MemberService {
	//단건조회
	public MemberVO selectMember(MemberVO memberVO);
	
	//회원가입
	public int insertMemberInfo(MemberVO memberVO) throws Exception;
	
	//인증번호 생성
		public int updateMailKey(MemberVO memberVO);
		
	//인증 확인
	public int updateMailAuth(MemberVO memberVO);
	
	//회원 수정
	public int updateMember(MemberVO memberVO);
	
	//회원삭제
	public int deleteMemberInfo(String memberId);
}
