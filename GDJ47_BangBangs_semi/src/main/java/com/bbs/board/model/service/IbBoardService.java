package com.bbs.board.model.service;

import static com.bbs.common.JDBCTemplate.*;
import java.sql.Connection;
import java.util.List;

import com.bbs.board.model.dao.IbBoardDao;
import com.bbs.model.vo.IbBoard;

public class IbBoardService {

	private IbBoardDao dao=new IbBoardDao();
	

	public List<IbBoard> selectIbBoardListById(String memberId, int cPage, int numPerpage) {
		Connection conn=getConnection();
		List<IbBoard> result=dao.selectIbBoardListById(conn,memberId,cPage,numPerpage);
		close(conn);
		return result;
	}


	public int selectIbBoardCountById(String memberId) {
		Connection conn=getConnection();
		int result=dao.selectIbBoardCountById(conn, memberId);
		close(conn);
		return result;
	}

}
