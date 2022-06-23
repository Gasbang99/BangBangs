package com.bbs.notice.model.dao;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Properties;
import static com.bbs.common.JDBCTemplate.*;

import com.bbs.model.vo.IbBoard;
import com.bbs.notice.model.vo.NoticeBoard;

public class NoticeDao {
private Properties prop=new Properties();
	
	public NoticeDao() {
		String path=NoticeDao.class.getResource("/sql/notice_sql.properties").getPath();
		try {
			prop.load(new FileReader(path));
		}catch(IOException e) {
			e.printStackTrace();
		}
	}
	public List<NoticeBoard> selectNoticeList(Connection conn,int cPage,int numPerpage){
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<NoticeBoard> list = new ArrayList();
		try {
			pstmt = conn.prepareStatement(prop.getProperty("selectNoticeList"));
			pstmt.setInt(1, (cPage-1)*numPerpage+1);
			pstmt.setInt(2, cPage*numPerpage);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				list.add(getNoticeBoard(rs));
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
			close(rs);
		}
		return list;
	}
	
	public int selectNoticeCount(Connection conn) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int result = 0;
		try {
			pstmt = conn.prepareStatement(prop.getProperty("selectNoticeCount"));
			rs=pstmt.executeQuery();
			if(rs.next())result=rs.getInt(1);
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
			close(rs);
		}
		return result;
	}
	public int insertNotice(Connection conn,NoticeBoard n) {
		PreparedStatement pstmt = null;
		int result = 0;
		try {
			pstmt = conn.prepareStatement(prop.getProperty("insertNotice"));
			pstmt.setString(1, n.getNoticeTitle());
			pstmt.setString(2, n.getNoticeContent());
			pstmt.setString(3, n.getIbBoardOriginalFilename());
			pstmt.setString(4, n.getIbBoardRenamedFilename());
			result=pstmt.executeUpdate();
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return result;
	}
	
	private NoticeBoard getNoticeBoard(ResultSet rs) throws SQLException {
		return NoticeBoard.builder()
				.noticeNum(rs.getInt("notice_num"))
				.noticeTitle(rs.getString("notice_title"))
				.noticeEnrollDate(rs.getDate("notice_enroll_date"))
				.noticeContent(rs.getString("notice_content"))
				.IbBoardOriginalFilename(rs.getString("ib_board_original_filename"))
				.IbBoardRenamedFilename(rs.getString("ib_board_renamed_filename"))
				.build();
	}
}
