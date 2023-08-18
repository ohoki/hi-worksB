package com.worksb.hi.notice.service.Impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.worksb.hi.common.PagingVO;
import com.worksb.hi.common.SearchVO;
import com.worksb.hi.notice.mapper.NoticeMapper;
import com.worksb.hi.notice.service.NoticeService;
import com.worksb.hi.notice.service.NoticeVO;

@Service
public class NoticeServiceImpl implements NoticeService {

	@Autowired
	NoticeMapper noticeMapper;
	
	// 게시글 갯수
	@Override
	public int noticeCount(SearchVO searchVO) {
		return noticeMapper.getTotalCount(searchVO);
	}

	// 페이징 전체 글 조회
	@Override
	public List<NoticeVO> getNoticeList(PagingVO pagingVO,SearchVO searchVO) {
		return noticeMapper.selectNoticeAll(pagingVO, searchVO);
	}

	@Override
	public NoticeVO getNoticeInfo(NoticeVO noticeVO) {
		return noticeMapper.getNoticeInfo(noticeVO);
	}

	@Override
	public int noticeInsert(NoticeVO noticeVO) {
		int result = noticeMapper.noticeInsert(noticeVO);
		if(result == 1) {
			return noticeVO.getNoticeId();
		}else {
			return 0;
		}
	}

	@Override
	public int noticeUpdate(NoticeVO noticeVO) {
		int result = noticeMapper.noticeUpdate(noticeVO);
		if(result == 1) {
			return noticeVO.getNoticeId();
		}
		return 0;
	}

	@Override
	public int noticeDelete(int noticeId) {
		int result = noticeMapper.noticeDelete(noticeId);
		if (result == 1) {
			return noticeId;
		}
		return 0;
	}



}
