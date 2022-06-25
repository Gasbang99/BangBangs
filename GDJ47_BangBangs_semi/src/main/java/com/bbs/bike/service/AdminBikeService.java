package com.bbs.bike.service;

import static com.bbs.common.JDBCTemplate.close;
import static com.bbs.common.JDBCTemplate.getConnection;

import java.sql.Connection;
import java.util.List;

import com.bbs.bikeManagement.dao.AdminBikeDao;
import com.bbs.model.vo.Bike;

public class AdminBikeService {

private AdminBikeDao dao=new AdminBikeDao();
	
	public List<Bike> selectBikeList(int cPage, int numPerpage){
		Connection conn=getConnection();
		List<Bike> result=dao.selectBikeList(conn,cPage,numPerpage);
		close(conn);
		return result;
	}
	public int selectBikeCount() {
		Connection conn=getConnection();
		int result=dao.selectBikeCount(conn);
		close(conn);
		return result;
	}
	
	public List<Bike> searchBikeList(String type, String keyword,int cPage,int numPerpage){
		Connection conn=getConnection();
		List<Bike> result=dao.searchBikeList(conn,type,keyword,cPage,numPerpage);
		close(conn);
		return result;
	}
	
	public int searchBikeCount(String type, String keyword) {
		Connection conn=getConnection();
		int result=dao.searchBikeCount(conn,type,keyword);
		close(conn);
		return result;
	}
	
	public List<String> searchUserId(String keyword){
		Connection conn=getConnection();
		List<String> result=dao.searchBikeId(conn, keyword);
		close(conn);
		return result;
		
		
	}
	
}
