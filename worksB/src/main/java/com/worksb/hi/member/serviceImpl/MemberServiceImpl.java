package com.worksb.hi.member.serviceImpl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.worksb.hi.member.mapper.MemberMapper;
import com.worksb.hi.member.service.MemberService;
import com.worksb.hi.member.service.MemberVO;

@Service
public class MemberServiceImpl implements MemberService {

	@Autowired
	MemberMapper memberMapper;
	
	//단건 조회
	@Override
	public MemberVO selectMember(MemberVO memberVO) {
		return memberMapper.selectMember(memberVO);
	}
	
	//회원 등록
	@Override
	public int insertMemberInfo(MemberVO memberVO) {
		int result = memberMapper.inserMemberInfo(memberVO);
		
		if(result == 1) {
			
		}
		return 0;
	}
}
