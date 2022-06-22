package com.bbs.model.dao;

import static com.bbs.common.JDBCTemplate.*;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Properties;

import com.bbs.model.vo.Member;

public class MemberDao {


	private Properties prop=new Properties();
	
	public MemberDao() {
		String path=MemberDao.class.getResource("/sql/member_sql.properties").getPath();
		try {
			prop.load(new FileReader(path));
		}catch(IOException e) {
			e.printStackTrace();
		}
	}
	
	public Member searchMember(Connection conn, String memberId, String password) {
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		Member m=null;
		try {
			pstmt=conn.prepareStatement(prop.getProperty("selectMember"));
			pstmt.setString(1,memberId);
			pstmt.setString(2, password);
			rs=pstmt.executeQuery();
			if(rs.next()) {
				m=getMember(rs);
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}return m;
		
	}
	
	public Member selectMemberById(Connection conn, String userId) {
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		Member m=null;
		try {
			pstmt=conn.prepareStatement(prop.getProperty("selectMemberById"));
			pstmt.setString(1, userId);
			rs=pstmt.executeQuery();
			if(rs.next()) m=getMember(rs);
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}return m;
	}
	
	public int insertMember(Connection conn, Member m) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		try {
			pstmt = conn.prepareStatement(prop.getProperty("insertMember"));
			pstmt.setString(1, m.getMemberId());
			pstmt.setString(2, m.getMemberPassword());
			pstmt.setString(3, m.getMemberName());
			pstmt.setString(4, m.getGender());
			pstmt.setString(5, m.getBirthday());
			pstmt.setString(6, m.getEmail());
			pstmt.setString(7, m.getAddress());
			pstmt.setString(8, m.getPhone());
			result = pstmt.executeUpdate();
			
			if(result>0) commit(conn);
			else rollback(conn);
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return result;
	}
	
	public int updatePassword(Connection conn, String memberId, String newPw) {
		PreparedStatement pstmt=null;
		int result=0;
		try {
			pstmt=conn.prepareStatement(prop.getProperty("updatePassword"));
			pstmt.setString(1,newPw);
			pstmt.setString(2, memberId);
			result=pstmt.executeUpdate();
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}return result;
	}
	
	//AdminDao에서 사용하기 위해 public static으로 변경
	public static Member getMember(ResultSet rs) {
		Member m=null;
		try {
			m=new Member();
			m.setMemberId(rs.getString("member_Id"));
			m.setMemberName(rs.getString("member_Name"));
			m.setGender(rs.getString("gender"));
			m.setBirthday(rs.getString("birthday"));
			m.setEmail(rs.getString("email"));
			m.setAddress(rs.getString("address"));
			m.setPhone(rs.getString("phone"));
			m.setEnrollDate(rs.getDate("enroll_Date"));
			m.setMemberLevel(rs.getString("member_Level"));
			m.setTotalMileage(rs.getInt("total_Mileage"));
		}catch(SQLException e) {
			e.printStackTrace();
		}
		return m;
	}

	public int updateMember(Connection conn, Member m) {
		PreparedStatement pstmt=null;
		int result=0;
		try {
			pstmt=conn.prepareStatement(prop.getProperty("updateMember"));
			pstmt.setString(1, m.getMemberName());
			pstmt.setString(2, m.getGender());
			pstmt.setString(3, m.getBirthday());
			pstmt.setString(4, m.getEmail());
			pstmt.setString(5, m.getPhone());
			pstmt.setString(6, m.getAddress());
			pstmt.setString(7, m.getMemberId());

			result=pstmt.executeUpdate();
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}return result;
	}

	public int deleteMember(Connection conn, String memberId) {
		PreparedStatement pstmt=null;
		int result=0;
		try {
			pstmt=conn.prepareStatement(prop.getProperty("deleteMember"));
			pstmt.setString(1,memberId);
			result=pstmt.executeUpdate();
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}return result;
	}

	public Member findMemberId(Connection conn, String name, String mailAddress) {
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		Member m=null;
		try {
			pstmt=conn.prepareStatement(prop.getProperty("findMemberId"));
			pstmt.setString(1, name);
			pstmt.setString(2, mailAddress);
			rs=pstmt.executeQuery();
			if(rs.next()) m=getMember(rs);
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}return m;
	}
}
