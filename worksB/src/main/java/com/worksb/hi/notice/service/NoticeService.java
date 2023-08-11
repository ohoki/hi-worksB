package com.worksb.hi.notice.service;

import java.util.List;

import com.worksb.hi.common.PagingVO;

public interface NoticeService {
	
	public int noticeCount();
	
	public List<NoticeVO> getNoticeList(PagingVO pagingVO);
	
	// 공지 목록
	
	
	// 공지 자세히보기
	public NoticeVO getNoticeInfo(NoticeVO noticeVO);
	
	// 공지 등록
	public int noticeInsert(NoticeVO noticeVO);
	
	// 공지 수정
	public int noticeUpdate(NoticeVO noticeVO);
	
	// 공지 삭제
	public int noticeDelete(int noticeId);

}
