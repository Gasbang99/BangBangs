package com.bbs.board.model.dao;

import static com.bbs.common.JDBCTemplate.close;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Properties;

import com.bbs.model.vo.IbBoard;

public class IbBoardDao {
	private Properties prop=new Properties();
	
	public IbBoardDao() {
		String path=IbBoardDao.class.getResource("/sql/member_sql.properties").getPath();
		try {
			prop.load(new FileReader(path));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	public List<IbBoard> selectIbBoardListById(Connection conn, String memberId, int cPage, int numPerpage) {
		PreparedStatement pstmt=null;
		List<IbBoard> result= new ArrayList();
		ResultSet rs = null;
		try {
			pstmt = conn.prepareStatement(prop.getProperty("selectIbBoardListById"));
			pstmt.setString(1, memberId);
			pstmt.setInt(2, (cPage-1)*numPerpage+1);
			pstmt.setInt(3, cPage*numPerpage);
			rs=pstmt.executeQuery();
			while(rs.next()) {
				result.add(getIbBoard(rs));
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}
		return result;
	}

	
	
	private IbBoard getIbBoard(ResultSet rs) throws SQLException {
		return IbBoard.builder()
				.ibPostNum(rs.getInt("ib_post_num"))
				.ibTitle(rs.getString("ib_title"))
				.ibEnrollDate(rs.getDate("ib_enroll_date"))
				.memberId(rs.getString("member_id"))
				.category(rs.getString("category"))
				.ibContent(rs.getString("ib_content"))
				.IbBoardOriginalFilename(rs.getString("ib_board_original_filename"))
				.IbBoardRenamedFilename(rs.getString("ib_board_renamed_filename"))
				.build();
	}
//	private IbBoard getIbBoard(ResultSet rs) {
//		IbBoard i=null;
//		try {
//			i=new IbBoard();
//			i.setIbPostNum(rs.getInt("ib_post_num"));
//			i.setIbTitle(rs.getString("ib_title"));
//			i.setIbEnrollDate(rs.getDate("ib_enroll_date"));
//			i.setMemberId(rs.getString("member_id"));
//			i.setCategory(rs.getString("category"));
//			i.setIbContent(rs.getString("ib_content"));
//			i.setIbBoardOriginalFilename(null);
//			i.setIbBoardRenamedFilename(null);
//		}
//	}



	public int selectIbBoardCountById(Connection conn, String userId) {
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		int result=0;
		try {
			pstmt=conn.prepareStatement(prop.getProperty("selectIbBoardCountById"));
			pstmt.setString(1, userId);
			rs=pstmt.executeQuery();
			if(rs.next()) result=rs.getInt(1);
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}return result;
	}
}
