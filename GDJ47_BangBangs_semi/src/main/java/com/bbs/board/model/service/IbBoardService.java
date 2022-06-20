package com.bbs.board.model.service;

import static com.bbs.common.JDBCTemplate.*;
import java.sql.Connection;
import java.util.List;

import com.bbs.board.model.dao.IbBoardDao;
import com.bbs.model.vo.IbBoard;

public class IbBoardService {

	private IbBoardDao dao=new IbBoardDao();
	

	public List<IbBoard> selectIbBoardListById(String userId, int cPage, int numPerpage) {
		Connection conn=getConnection();
		List<IbBoard> result=dao.selectIbBoardListById(conn,userId,cPage,numPerpage);
		close(conn);
		return result;
	}


	public int selectIbBoardCountById(String userId) {
		Connection conn=getConnection();
		int result=dao.selectIbBoardCountById(conn, userId);
		close(conn);
		return result;
	}

}
