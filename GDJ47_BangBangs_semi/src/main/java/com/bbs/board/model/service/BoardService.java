package com.bbs.board.model.service;

import static com.bbs.common.JDBCTemplate.close;
import static com.bbs.common.JDBCTemplate.commit;
import static com.bbs.common.JDBCTemplate.getConnection;
import static com.bbs.common.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.List;

import com.bbs.board.model.dao.BoardDao;
import com.bbs.model.vo.IbBoard;
import com.bbs.model.vo.IbBoardComment;
import com.bbs.model.vo.Member;
;
public class BoardService {
	
	private BoardDao dao=new BoardDao();
	public List<IbBoard> selectBoardList(int cPage,int numPerpage){
		Connection conn=getConnection();
		List<IbBoard> result=dao.selectBoardList(conn,cPage,numPerpage);
		close(conn);
		return result;
	}
	
	
	public int selectBoardCount() {
		Connection conn=getConnection();
		int result=dao.selectBoardCount(conn);
		close(conn);
		return result;
	}
	public int insertBoard(IbBoard b) {
		Connection conn=getConnection();
		int result=dao.insertBoard(conn,b);
		if(result>0)commit(conn);
		else rollback(conn);
		close(conn);
		return result;
	}
	public IbBoard selectBoard(int boardNo) {
		Connection conn=getConnection();
		IbBoard b = dao.selectBoard(conn,boardNo);
		close(conn);
		return b;
	}
	public int insertBoardComment(IbBoardComment ibc) {
		Connection conn=getConnection();
		int result=dao.insertBoardComment(conn,ibc);
		if(result>0)commit(conn);
		else rollback(conn);
		close(conn);
		return result;
      }
	public int updateMember(IbBoard b) {
		Connection conn=getConnection();
		int result=dao.updateMember(conn,b);
		if(result>0)commit(conn);
		else rollback(conn);
		close(conn);
		return result;
	}
	public int deleteBoard(int boardNo) {
		Connection conn=getConnection();
		int result=dao.deleteBoard(conn,boardNo);
		if(result>0)commit(conn);
		else rollback(conn);
		close(conn);
		return result;
	}
	public List<String> searchMemberId(String keyword){
		Connection conn=getConnection();
		List<String> result=dao.searchMemberId(conn,keyword);
		close(conn);
		return result;
	}
	public List<IbBoard> searchIbBoardList(String type,String keyword,int cPage,int numPerpage){
		Connection conn=getConnection();
		List<IbBoard> result = dao.searchIbBoardList(conn,type,keyword,cPage,numPerpage);
		close(conn);
		return result;
	}
	public int searchIbBoardCount(String type,String keyword) {
		Connection conn=getConnection();
		int result=dao.searchIbBoardCount(conn,type,keyword);
		close(conn);
		return result;
	}
	public List<IbBoardComment> selectIbBoardCommentList(int boardNo){
	Connection conn=getConnection();
		List<IbBoardComment> result=dao.selectIbBoardCommentList(conn,boardNo);
		close(conn);
		return result;
	}
	public int deleteBoardComment(int boardNo) {
		Connection conn=getConnection();
		int result=dao.deleteBoardComment(conn,boardNo);
		if(result>0)commit(conn);
		else rollback(conn);
		close(conn);
		return result;
	}
}
