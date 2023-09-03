package com.worksb.hi.member.mapper;

import java.util.List;

import com.worksb.hi.member.service.MemberVO;

public interface MemberMapper {
	//전체조회
	public List<MemberVO> getMemberListByCompany(MemberVO memberVO);
	
	//단건조회
	public MemberVO selectMember(MemberVO memberVO);
	
	//회원가입
	public int inserMemberInfo(MemberVO memberVO);
	
	//인증번호 생성
	public int updateMailKey(MemberVO memberVO);
	
	//인증 확인
	public int updateMailAuth(MemberVO memberVO);
	
	//회원 수정
	public int updateMember(MemberVO memberVO);
	
	//회원삭제
	public int deleteMemberInfo(String memberId);
	
	// 내프로젝트
	public List<MemberVO> getProjectList(MemberVO memberVO);
	
	// 메모장
	public int insertMemo(MemberVO memberVO);
	public int updateMemo(MemberVO memberVO);
	public MemberVO getMemo(MemberVO memberVO);
	
	// 공지사항
	public List<MemberVO> getNoticeList(MemberVO memberVO);
	
	//접속상태 변경
	public void updateMemberState(MemberVO member);
	
}
