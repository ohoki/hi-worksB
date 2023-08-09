package com.worksb.hi.notice.service.Impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.worksb.hi.notice.mapper.NoticeMapper;
import com.worksb.hi.notice.service.NoticeService;
import com.worksb.hi.notice.service.NoticeVO;

@Service
public class NoticeServiceImpl implements NoticeService {

	@Autowired
	NoticeMapper noticeMapper;
	
	@Override
	public List<NoticeVO> getNoticeList() {
		return noticeMapper.getNoticeList();
	}

	@Override
	public NoticeVO getNoticeInfo(NoticeVO noticeVO) {
		return noticeMapper.getNoticeInfo(noticeVO);
	}

	@Override
	public int insertNotice(NoticeVO noticeVO) {
		int result = noticeMapper.insertNotice(noticeVO);
		if(result == 1) {
			return noticeVO.getNoticeId();
		}else {
			return 0;
		}
	}

	@Override
	public int updateNotice(NoticeVO noticeVO) {
		
		return 0;
	}

	@Override
	public int deleteNotice(int noticeId) {
		
		return 0;
	}

}
