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
	
	@Override
	public int insertMemberInfo(MemberVO memberVO) {
		int result = memberMapper.inserMemberInfo(memberVO);
		
		if(result == 1) {
			
		}
		return 0;
	}

}
