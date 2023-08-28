package com.worksb.hi.boardCmt.mapper;

import java.util.List;

import com.worksb.hi.boardCmt.service.BoardCmtVO;

public interface BoardCmtMapper {
	
    List<BoardCmtVO> selectCommentsByBoardId(int boardId);
    
    List<BoardCmtVO> selectRepliesByCommentId(int commentId);
    
    void insertComment(BoardCmtVO comment);
    
    void insertReply(BoardCmtVO reply);
    
    void updateComment(BoardCmtVO comment);
    
    void deleteComment(int commentId);

}
