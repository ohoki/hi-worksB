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
	BoardCmtMapper boardCmtMapper; 
	
	// 댓글 대댓글 조회
	@Override
	public List<BoardCmtVO> boardCmtList(BoardCmtVO boardCmtVO) {
		return boardCmtMapper.boardCmtList(boardCmtVO);
	}

	// 댓글 등록
	@Override
	public int boardCmtInsert(BoardCmtVO boardCmtVO) {
		int result = boardCmtMapper.boardCmtInsert(boardCmtVO);
		if(result == 1) {
			return boardCmtVO.getBoardId();
		}
		return 0;
	}

	// 댓글 수정
	@Override
	public int boardCmtUpdate(BoardCmtVO boardCmtVO) {
		int result = boardCmtMapper.boardCmtUpdate(boardCmtVO);
		if(result == 1) {
			return boardCmtVO.getBoardId();
		}
		return 0;
	}

	@Override
	public int boardCmtDelete(BoardCmtVO boardCmtVO) {
		int result = boardCmtMapper.boardCmtDelete(boardCmtVO);
		if(result == 1) {
			return boardCmtVO.getBoardId();
		}
		return 0;
	}

	@Override
	public int realCmtDelete(BoardCmtVO boardCmtVO) {
		int result = boardCmtMapper.realCmtDelete(boardCmtVO);
		if(result == 1) {
			return boardCmtVO.getBoardId();
		}
		return 0;
	}


	

}