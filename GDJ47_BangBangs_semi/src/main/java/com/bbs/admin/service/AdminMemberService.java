package com.bbs.admin.service;

import static com.bbs.common.JDBCTemplate.*;

import java.sql.Connection;
import java.util.List;

import com.bbs.adminMember.dao.AdminDao;
import com.bbs.model.vo.Member;

public class AdminMemberService {
	private AdminDao dao=new AdminDao();
	
	public List<Member> selectMemberList(int cPage, int numPerpage){
		Connection conn=getConnection();
		List<Member> result=dao.selectMemberList(conn,cPage,numPerpage);
		close(conn);
		return result;
	}
	public int selectMemberCount() {
		Connection conn=getConnection();
		int result=dao.selectMemberCount(conn);
		close(conn);
		return result;
	}
	
	public List<Member> searchMemberList(String type, String keyword,int cPage,int numPerpage){
		Connection conn=getConnection();
		List<Member> result=dao.searchMemberList(conn,type,keyword,cPage,numPerpage);
		close(conn);
		return result;
	}
	
	public int searchMemberCount(String type, String keyword) {
		Connection conn=getConnection();
		int result=dao.searchMemberCount(conn,type,keyword);
		close(conn);
		return result;
	}
	
	public List<String> searchUserId(String keyword){
		Connection conn=getConnection();
		List<String> result=dao.searchUserId(conn, keyword);
		close(conn);
		return result;
		
		
	}

}
