package com.worksb.hi.notice.mapper;

import java.util.List;

import com.worksb.hi.notice.service.NoticeVO;

public interface NoticeMapper {
	
	// 공지 목록
	public List<NoticeVO> getNoticeList();
	
	// 공지 자세히보기
	public NoticeVO getNoticeInfo(NoticeVO noticeVO);
	
	// 공지 등록
	public int insertNotice(NoticeVO noticeVO);
	
	// 공지 수정
	public int updateNotice(NoticeVO noticeVO);
	
	// 공지 삭제
	public int deleteNotice(int noticeId);
}
