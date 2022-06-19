package com.bbs.model.service;

import static com.bbs.common.JDBCTemplate.*;

import java.sql.Connection;

import com.bbs.model.vo.Member;
import com.bbs.model.dao.MemberDao;

public class MemberService {
	
	private MemberDao dao=new MemberDao();

	public Member selectMemberById(String userId) {
		Connection conn=getConnection();
		Member m=dao.selectMemberById(conn,userId);
		close(conn);
		return m;
	}
	
}
