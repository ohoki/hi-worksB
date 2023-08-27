package com.worksb.hi.comLike.service;

public interface ComLikeService {
	
    public void insertLike(ComLikeVO comLikeVO);
    public void deleteLike(ComLikeVO comLikeVO);
    public int countLikes(ComLikeVO comLikeVO);
    public boolean checkLiked(ComLikeVO comLikeVO);
    
}
