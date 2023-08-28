package com.worksb.hi.notice.service;

import java.util.List;

import com.worksb.hi.common.PagingVO;
import com.worksb.hi.common.SearchVO;

public interface NoticeService {
	
	// 게시물 총 갯수
	public int noticeCount(SearchVO searchVO);
	
	// 공지 리스트
	public List<NoticeVO> getNoticeList(PagingVO pagingVO, SearchVO searchVO);

	// 공지 자세히보기
	public NoticeVO getNoticeInfo(NoticeVO noticeVO);
	
	// 공지 등록
	public int noticeInsert(NoticeVO noticeVO);
	
	// 공지 수정
	public int noticeUpdate(NoticeVO noticeVO);
	
	// 공지 삭제
	public int noticeDelete(int noticeId);

	// 조회수 올리기
	public void noticeHit(int noticeId);
	
	// 회사 정보 가져오기
	public List<NoticeVO> getNoticeListByCompanyId(PagingVO pagingVO, SearchVO searchVO, int companyId);

}
