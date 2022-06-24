package com.bbs.adminMember.dao;

import static com.bbs.common.JDBCTemplate.*;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Properties;

import com.bbs.model.dao.MemberDao;
import com.bbs.model.vo.Member;

public class AdminDao {
private Properties prop=new Properties();
	
	public AdminDao() {
		String path=AdminDao.class.getResource("/sql/admin_sql.properties").getPath();
		try {
			prop.load(new FileReader(path));
		}catch(IOException e) {
			e.printStackTrace();
		}
	}
	
	public List<Member> selectMemberList(Connection conn,int cPage, int numPerpage){
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		List<Member> list=new ArrayList();
		try {
			pstmt=conn.prepareStatement(prop.getProperty("selectMemberList"));
			
			 pstmt.setInt(1, (cPage-1)*numPerpage+1);
			 pstmt.setInt(2, cPage*numPerpage);
			 
			rs=pstmt.executeQuery();
			while(rs.next()) {
//				Member m=MemberDao.getMember(rs);
//				list.add(m);
				list.add(MemberDao.getMember(rs));
			}
			
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}return list;
	}
	
	
	public int selectMemberCount(Connection conn) {
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		int result=0;
		try {
			pstmt=conn.prepareStatement(prop.getProperty("selectMemberCount"));
			rs=pstmt.executeQuery();
			if(rs.next()) result=rs.getInt(1);
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}return result;
	}
	
	
	public List<Member> searchMemberList(Connection conn, String type, String  keyword,
				int cPage, int numPerpage){
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		List<Member> result=new ArrayList();
		String sql=prop.getProperty("searchMember");
		sql=sql.replace("$COL", type);
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, type.equals("MEMBER_NAME")?"%"+keyword+"%":keyword);
			pstmt.setInt(2, (cPage-1)*numPerpage+1);
			pstmt.setInt(3, cPage*numPerpage);
			rs=pstmt.executeQuery();
			while(rs.next()) {
				result.add(MemberDao.getMember(rs));
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}return result;
	}
	
	public int searchMemberCount(Connection conn, String type, String keyword) {
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		String sql=prop.getProperty("searchMemberCount").replace("$COL",type);
		int result=0;
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, type.equals("MEMBER_NAME")?"%"+keyword+"%":keyword);
			rs=pstmt.executeQuery();
			if(rs.next()) result=rs.getInt(1);
			
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}return result;
		
	}
	
	public List<String> searchUserId(Connection conn, String keyword){
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		List<String> result=new ArrayList();
		try {
			pstmt=conn.prepareStatement("SELECT MEMBER_ID FROM MEMBER WHERE MEMBER_ID LIKE '%"+keyword+"%'");
			rs=pstmt.executeQuery();
			while(rs.next()) {
				result.add(rs.getString(1));
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}return result;
		
	}
}
