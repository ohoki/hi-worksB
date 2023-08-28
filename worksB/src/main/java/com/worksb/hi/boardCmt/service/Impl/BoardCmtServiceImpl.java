package com.worksb.hi.boardCmt.service.Impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.worksb.hi.boardCmt.mapper.BoardCmtMapper;
import com.worksb.hi.boardCmt.service.BoardCmtService;
import com.worksb.hi.boardCmt.service.BoardCmtVO;

@Service
public class BoardCmtServiceImpl implements BoardCmtService {

    @Autowired
    private BoardCmtMapper boardCmtMapper;

    @Override
    public List<BoardCmtVO> getCommentsByBoardId(int boardId) {
        return boardCmtMapper.selectCommentsByBoardId(boardId);
    }

    @Override
    public List<BoardCmtVO> getRepliesByCommentId(int commentId) {
        return boardCmtMapper.selectRepliesByCommentId(commentId);
    }

    @Override
    public void addComment(BoardCmtVO comment) {
        boardCmtMapper.insertComment(comment);
    }

    @Override
    public void addReply(BoardCmtVO reply) {
        boardCmtMapper.insertReply(reply);
    }

    @Override
    public void updateComment(BoardCmtVO comment) {
        boardCmtMapper.updateComment(comment);
    }

    @Override
    public void deleteComment(int commentId) {
        boardCmtMapper.deleteComment(commentId);
    }

}
