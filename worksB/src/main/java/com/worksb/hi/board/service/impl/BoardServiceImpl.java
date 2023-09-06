package com.worksb.hi.board.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.worksb.hi.board.mapper.BoardMapper;
import com.worksb.hi.board.service.AllTaskBoardVO;
import com.worksb.hi.board.service.BoardService;
import com.worksb.hi.board.service.BoardVO;
import com.worksb.hi.board.service.ScheParticirVO;
import com.worksb.hi.board.service.ScheVO;
import com.worksb.hi.board.service.TaskVO;
import com.worksb.hi.board.service.VoteVO;
import com.worksb.hi.project.service.ProjectVO;

@Service
public class BoardServiceImpl implements BoardService {
	//이진
	
	@Autowired
	BoardMapper boardMapper;
	
	// 게시글 등록
	@Override
	public int insertBoard(BoardVO boardVO) {
		int result = boardMapper.insertBoard(boardVO);
		if(result == 1) {
			return boardVO.getPrjBoardId();
		}else {
			return -1;
		}
	}
	
	// 업무글 등록
	@Override
	public int insertTask(TaskVO taskVO) {
		int result = boardMapper.insertTask(taskVO);
		if(result == 1) {
			return taskVO.getPrjBoardId();
		}else {
			return -1;
		}
	}
	
	// 투표글 등록
	@Override
	public int insertVote(VoteVO voteVO) {
		int result = boardMapper.insertVote(voteVO);
    	// 투표 항목 등록
    	String[] listContentArr = voteVO.getListContent().split(",");
    	
    	for(int i=0; i<listContentArr.length; i++) {
    		voteVO.setListContent(listContentArr[i]);
    		boardMapper.insertVoteList(voteVO);
    	}
	
		return result;

	}
	
	//투표 항목 등록
	@Override
	public int insertVoteList(VoteVO voteVO) {
		int result = boardMapper.insertVoteList(voteVO);
		if(result == 1) {
			return voteVO.getPrjBoardId();
		}else {
			return -1;
		}
	}
	
	//일정 등록
	@Override
	public int insertSche(ScheVO scheVO) {
		int result = boardMapper.insertSche(scheVO);
		if(result == 1) {
			return scheVO.getPrjBoardId();
		}else {
			return -1;
		}
	}

	// 일정 조회
	@Override
	public ScheVO getScheInfo(ScheVO scheVO) {
		return boardMapper.getScheInfo(scheVO);
	}
	
	// 투표 조회
	@Override
	public List<VoteVO> getVoteInfo(VoteVO voteVO) {
		return boardMapper.getVoteInfo(voteVO);
	}
	
	// 투표 항목 조회
	@Override
	public List<VoteVO> getVoteList(VoteVO voteVO) {
		return boardMapper.getVoteList(voteVO);
	}
	
	// 업무 조회
	@Override
	public List<AllTaskBoardVO> getTaskInfo(AllTaskBoardVO allTaskBoardVO) {
		return boardMapper.getTaskInfo(allTaskBoardVO);
	}
	
	// 상위 업무 taskId 조회
	@Override
	public int getHighTaskId(AllTaskBoardVO allTaskBoardVO) {
		return boardMapper.getHighTaskId(allTaskBoardVO);
	}
	
	// 하위 업무 조회
	@Override
	public List<AllTaskBoardVO> getSubTask(int TaskId) {
		return boardMapper.getSubTask(TaskId);
	}

	// 업무 담당자 등록
	@Override
	public int insertTaskManager(TaskVO taskVO) {
		return boardMapper.insertTaskManager(taskVO);
	}
	
	// 업무 담당자 조회
	@Override
	public List<AllTaskBoardVO> getManager(AllTaskBoardVO allTaskBoardVO) {
		return boardMapper.getManager(allTaskBoardVO);
	}
	
	// 업무탭 리스트
	@Override
	public List<AllTaskBoardVO> getTaskList(int projectId) {
		return boardMapper.getTaskList(projectId);
	}
	
	// 업무 수정
	@Override
	public int updateTask(TaskVO taskVO) {
		return boardMapper.updateTask(taskVO);
	}
	
	// 업무게시글의의 담당자 전체 리스트 삭제
	public int deleteManagerList(TaskVO taskVO) {
		return boardMapper.deleteManagerList(taskVO);
	}
	
	// //게시글 별 일정 참여자 리스트 출력
	public List<ScheParticirVO> getParticir(ScheParticirVO particir) {
		return boardMapper.getParticir(particir);
	};
	
	//게시글 별 투표 참여자 리스트 출력
	public List<VoteVO> getVoteParticir(VoteVO particir) {
		return boardMapper.getVoteParticir(particir);
	} 
	
	//업무 정보 변경
    public int updateTaskInfo(AllTaskBoardVO taskVO) {
    	return boardMapper.updateTaskInfo(taskVO);
    }
	
	
	
	
	
	
	
	
	@Override
	public int insertPrjLike(BoardVO boardVO) {
		return boardMapper.insertPrjLike(boardVO);
	}

	@Override
	public int deletePrjLike(BoardVO boardVO) {
		return boardMapper.deletePrjLike(boardVO);
	}

	@Override
	public BoardVO getMemLike(BoardVO boardVO) {
		return boardMapper.getMemLike(boardVO);
	}

	@Override
	public List<BoardVO> getPrjLike(BoardVO boardVO) {
		return boardMapper.getPrjLike(boardVO);
	}

	//북마크 조회
	@Override
	public BoardVO getBookmarkInfo(BoardVO boardVO) {
		return boardMapper.getBookmarkInfo(boardVO);
	}
	
	// 게시글 정보
	@Override
	public BoardVO getBoardInfo(int prjBoardId) {
		return boardMapper.getBoardInfo(prjBoardId);
	}
	
  // 업무삭제
	@Override
	public int deleteTask(TaskVO taskVO) {
		return boardMapper.deleteTask(taskVO);
	}
	
	// 투표글 삭제
	@Override
	public int deleteVote(VoteVO voteVO) {
		return boardMapper.deleteVote(voteVO);
	}
	// 일반글 삭제
	@Override
	public int deleteBoard(BoardVO boardVO) {
		return boardMapper.deleteBoard(boardVO);
	}
	// 투표한 인원수
	@Override
	public int countVoteParticir(VoteVO voteVO) {
		return boardMapper.countVoteParticir(voteVO);
	}
	@Override
	public int updateVote(VoteVO voteVO) {
		return boardMapper.updateVote(voteVO);
	}
	
	//일반글 수정
	@Override
	public int updateBoard(BoardVO boardVO) {
		return boardMapper.updateBoard(boardVO);
	}

	@Override
	public int updateTaskManager(TaskVO taskVO) {
		return boardMapper.updateTaskManager(taskVO);
	}

	// 상단 고정 업데이트
	public int updatePin(BoardVO boardVO) {
		return boardMapper.updatePin(boardVO);
	};
	
	// 회원의 프로젝트 별 북마크 리스트
	public List<BoardVO> getBookmarkList(ProjectVO projectVO) {
		return boardMapper.getBookmarkList(projectVO);
	};
	
	// 게시글 북마크 등록
	public int insertBookmark(BoardVO boardVO) {
		return boardMapper.insertBookmark(boardVO);
	};
	
	// 게시글 북마크 삭제
	public int deleteBookmark(BoardVO boardVO) {
		return boardMapper.deleteBookmark(boardVO);
	};
	
	// 일정 참가,미참
	public int sheParticipate(ScheParticirVO spVO) {
		return boardMapper.sheParticipate(spVO);
	};
	
	//투표 하기 (삭제 -> 등록)
	public int voteInsert(List<VoteVO> voteList){
		int result = 0;
		//참가자의 투표 내용 삭제
		boardMapper.voteDelete(voteList.get(0));
		//재등록
		for(int i=0; i<voteList.size(); i++) {
			result = boardMapper.voteInsert(voteList.get(i));
		}
		
		return result;
	};
	
	//투표 취소
	public void votePaticirDelete(VoteVO voteVO) {
		boardMapper.voteDelete(voteVO);
	};
	
	//내가 선택한 투표 리스트
	public List<VoteVO> getVoteListByMember(VoteVO voteVO) {
		return boardMapper.getVoteListByMember(voteVO);
	};
	
	
	
	
	
	//정현
	//프로젝트 일정 캘린더 조회
	@Override
	public List<ScheVO> getScheCalendar(int projectId) {
		return boardMapper.getScheCalendar(projectId);
	}
	//프로젝트 업무 캘린더 조회
	@Override
	public List<TaskVO> getTaskCalendar(int projectId) {
		return boardMapper.getTaskCalendar(projectId);
	}
	//프로젝트 일정 상세 조회
	@Override
	public BoardVO getScheBoardInfo(int prjBoardId) {
		return boardMapper.getScheBoardInfo(prjBoardId);
	}
	//프로젝트 일정 수정
	@Override
	public int updateSche(ScheVO scheVO) {
		return boardMapper.updateSche(scheVO);
	}
	//프로젝트 일정 삭제
	@Override
	public int deleteSche(ScheVO scheVO) {
		return boardMapper.deleteSche(scheVO.getPrjBoardId());
	}
	//프로젝트 일정 참가자 삭제
	@Override
	public int deleteScheParticir(int prjBoardId) {
		return boardMapper.deleteScheParticir(prjBoardId);
	}
	//프로젝트 캘린더 검색 조회
	@Override
	public List<BoardVO> searchCalendarBoard(BoardVO boardVO) {
		return boardMapper.searchCalendarBoard(boardVO);
	}
	//프로젝트 캘린더 일정 검색 조회
	@Override
	public ScheVO searchScheCal(int prjBoardId) {
		return boardMapper.searchScheCalendar(prjBoardId);
	}
	//프로젝트 캘린더 업무 검색 조회
	@Override
	public TaskVO searchTaskCal(int prjBoardId) {
		return boardMapper.searchTaskCalendar(prjBoardId);
	}
	//프로젝트 캘린더 북마크 여부 조회
	@Override
	public List<BoardVO> findMarkedUserId(int prjBoardId) {
		return boardMapper.findMarkedUser(prjBoardId);
	}
	
	@Override
	public List<AllTaskBoardVO> searchingTaskManagerList(String title) {
		return boardMapper.searchingTaskManagerList(title);
	}

	@Override
	public List<AllTaskBoardVO> searchingList(String title) {
		return boardMapper.searchingList(title);
	}


	

	
	
	

	

	

	

	

	
}
