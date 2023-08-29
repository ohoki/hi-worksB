package com.worksb.hi.member.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;

import com.worksb.hi.common.MailHandler;
import com.worksb.hi.common.TempKey;
import com.worksb.hi.member.mapper.MemberMapper;
import com.worksb.hi.member.service.MemberService;
import com.worksb.hi.member.service.MemberVO;

@Service
public class MemberServiceImpl implements MemberService {

	@Autowired
	MemberMapper memberMapper;
	@Autowired
	JavaMailSender mailSender;
	
	//전체조회
	public List<MemberVO> getMemberListByCompany(MemberVO memberVO) {
		return memberMapper.getMemberListByCompany(memberVO);
	};
	
	//단건 조회
	@Override
	public MemberVO selectMember(MemberVO memberVO) {
		return memberMapper.selectMember(memberVO);
	}
	
	//회원 등록
	@Override
	public int insertMemberInfo(MemberVO memberVO) throws Exception {
		int result = 0;
		
		//난수 생성
		String mailKey = new TempKey().getKey(30, false);
		memberVO.setMailKey(mailKey);
		
		//회원 등록
		result = memberMapper.inserMemberInfo(memberVO);
		
		if(result == 1) { //정상등록되면 인증키 등록
			result = memberMapper.updateMailKey(memberVO);
		}
		
		if(result == 1) { //정상등록되면 이메일 인증 메일 요청
			try {
				MailHandler sendMail = new MailHandler(mailSender);
				sendMail.setSubject("hi-worksB 인증메일 입니다.");
				sendMail.setText(
						"<h1>hi-worksB 메일인증</h1>" +
				        "<br><br>hi-worksB에 가입해주셔서 감사합니다!!" +
				        "<br><br>아래 [이메일 인증 확인]을 눌러주세요." +
		                "<br><br><a href='http://localhost/hi/registerEmail?memberId=" + memberVO.getMemberId() +
		                "&mailKey=" + mailKey +
		                "' target='_blank'>이메일 인증 확인</a>", true);
				sendMail.setFrom("cyh6237@gmail.com", "hi-worksB");
				sendMail.setTo(memberVO.getMemberId());
				sendMail.send();
			} catch (Exception e) {
				//인증 메일이 정상작동하지 않으면 회원정보 삭제
				memberMapper.deleteMemberInfo(memberVO.getMemberId());
				result = 0;
			}
		}
		return result;
	}//insertMemberInfo

	//인증번호 생성
	@Override
	public int updateMailKey(MemberVO memberVO) {
		return memberMapper.updateMailKey(memberVO);
	}

	//인증 확인
	@Override
	public int updateMailAuth(MemberVO memberVO) {
		return memberMapper.updateMailAuth(memberVO);
	}
	
	//회원 수정
	public int updateMember(MemberVO memberVO) {
		return memberMapper.updateMember(memberVO);
	};
	
	//회원 삭제
	@Override
	public int deleteMemberInfo(String memberId) {
		return memberMapper.deleteMemberInfo(memberId);
	}

	// 내 프로젝트
	@Override
	public List<MemberVO> getProjectList(MemberVO memberVO) {
		return memberMapper.getProjectList(memberVO);
	}

	@Override
	public int insertMemo(MemberVO memberVO) {
		return memberMapper.insertMemo(memberVO);
	}

	@Override
	public int updateMemo(MemberVO memberVO) {
		return memberMapper.updateMemo(memberVO);
	}

	@Override
	public List<MemberVO> getNoticeList(MemberVO memberVO) {
		return memberMapper.getNoticeList(memberVO);
	}

	@Override
	public MemberVO getMemo(MemberVO memberVO) {
		return memberMapper.getMemo(memberVO);
	}
}
