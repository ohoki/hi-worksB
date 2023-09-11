package com.worksb.hi.comLike.service.Impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.worksb.hi.comLike.mapper.ComLikeMapper;
import com.worksb.hi.comLike.service.ComLikeService;
import com.worksb.hi.comLike.service.ComLikeVO;

@Service
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

	
	@Override 
	public String noticeLikeCount(int noticeId, ComLikeVO comLikeVO) {
		return comLikeMapper.noticeLikeCount(noticeId); 
	}



}
