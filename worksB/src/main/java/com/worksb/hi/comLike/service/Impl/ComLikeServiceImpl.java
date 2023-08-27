package com.worksb.hi.comLike.service.Impl;

import org.springframework.beans.factory.annotation.Autowired;

import com.worksb.hi.comLike.mapper.ComLikeMapper;
import com.worksb.hi.comLike.service.ComLikeService;
import com.worksb.hi.comLike.service.ComLikeVO;

public class ComLikeServiceImpl implements ComLikeService {

    @Autowired
    ComLikeMapper comLikeMapper;

    @Override
    public void insertLike(ComLikeVO comLikeVO) {
        comLikeMapper.insertLike(comLikeVO);
    }

    @Override
    public void deleteLike(ComLikeVO comLikeVO) {
        comLikeMapper.deleteLike(comLikeVO);
    }

    @Override
    public int countLikes(ComLikeVO comLikeVO) {
        return comLikeMapper.countLikes(comLikeVO);
    }

    @Override
    public boolean checkLiked(ComLikeVO comLikeVO) {
        return comLikeMapper.checkLiked(comLikeVO) > 0;
    }

	// noticeList에서 좋아요 카운트
	@Override
	public int noticeLikeCount(int noticeId) {
		return comLikeMapper.noticeLikeCount(noticeId);
	}
}
