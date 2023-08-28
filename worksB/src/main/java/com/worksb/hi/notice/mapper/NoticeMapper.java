package com.worksb.hi.notice.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.worksb.hi.common.PagingVO;
import com.worksb.hi.common.SearchVO;
import com.worksb.hi.notice.service.NoticeVO;

public interface NoticeMapper {
	
	// 페이징 게시물 총 갯수
	public int getTotalCount(SearchVO searchVO);
	
	// 페이징 게시글 전체 조회
	public List<NoticeVO> selectNoticeAll(@Param("pagingVO") PagingVO pagingVO, @Param("searchVO")SearchVO searchVO);
	
	// 공지 자세히보기
	public NoticeVO getNoticeInfo(NoticeVO noticeVO);
	
	// 공지 등록
	public int noticeInsert(NoticeVO noticeVO);
	
	// 공지 수정
	public int noticeUpdate(NoticeVO noticeVO);
	
	// 공지 삭제
	public int noticeDelete(int noticeId);
	
	// 조회수 올리기
	public int noticeHit(int noticeId);
}
