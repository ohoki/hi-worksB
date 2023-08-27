package com.worksb.hi.comLike.service;

public interface ComLikeService {
	
	// 추가
    public void insertLike(ComLikeVO comLikeVO);
    // 삭제
    public void deleteLike(ComLikeVO comLikeVO);
    // 카운트
    public int countLikes(ComLikeVO comLikeVO);
    // 좋아요 눌렀는지 체크
    public boolean checkLiked(ComLikeVO comLikeVO);
	// noticeList에서 좋아요 총 갯수
	public int noticeLikeCount(int noticeId);
}
