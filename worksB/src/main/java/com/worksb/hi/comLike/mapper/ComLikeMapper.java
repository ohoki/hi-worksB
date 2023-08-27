package com.worksb.hi.comLike.mapper;

import com.worksb.hi.comLike.service.ComLikeVO;

public interface ComLikeMapper {
	
    public void insertLike(ComLikeVO comLikeVO);
    public void deleteLike(ComLikeVO comLikeVO);
    public int countLikes(ComLikeVO comLikeVO);
    public int checkLiked(ComLikeVO comLikeVO);
}
