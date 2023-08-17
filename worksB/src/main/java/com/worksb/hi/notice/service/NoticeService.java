package com.worksb.hi.notice.service;

import java.util.List;

import com.worksb.hi.common.PagingVO;

public interface NoticeService {
	// 게시물 총 갯수
	public int noticeCount();
	
	// 공지 리스트
	public List<NoticeVO> getNoticeList(PagingVO pagingVO);

	// 공지 자세히보기
	public NoticeVO getNoticeInfo(NoticeVO noticeVO);
	
	// 공지 등록
	public int noticeInsert(NoticeVO noticeVO);
	
	// 공지 수정
	public int noticeUpdate(NoticeVO noticeVO);
	
	// 공지 삭제
	public int noticeDelete(int noticeId);

}
