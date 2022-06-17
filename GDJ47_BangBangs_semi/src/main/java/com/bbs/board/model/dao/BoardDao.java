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



public class BoardDao {
	private Properties prop=new Properties();
	
	public BoardDao() {
		String path=BoardDao.class.getResource("/sql/board_sql.properties").getPath();
		try {
			prop.load(new FileReader(path));
		}catch(IOException e) {
			e.printStackTrace();
		}
	}
	public List<IbBoard> selectBoardList(Connection conn,int cPage,int numPerpage){
		PreparedStatement pstmt=null;
		List<IbBoard> result= new ArrayList();
		ResultSet rs = null;
		try {
			pstmt = conn.prepareStatement(prop.getProperty("selectBoardList"));
			pstmt.setInt(1, (cPage-1)*numPerpage+1);
			pstmt.setInt(2, cPage*numPerpage);
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
	
	public int selectBoardCount(Connection conn) {
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		int result=0;
		try {
			pstmt= conn.prepareStatement(prop.getProperty("selectBoardCount"));
			rs=pstmt.executeQuery();
			if(rs.next())result=rs.getInt(1);
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}
		return result;
	}
	public int insertBoard(Connection conn,IbBoard b) {
		PreparedStatement pstmt = null;
		int result = 0;
		try {
			pstmt = conn.prepareStatement(prop.getProperty("insertBoard"));
			pstmt.setString(1, b.getIbTitle());
			pstmt.setString(2, b.getMemberId());
			pstmt.setString(3, b.getCategory());
			pstmt.setString(4, b.getIbContent());
			pstmt.setString(5, b.getIbBoardOriginalFilename());
			pstmt.setString(6, b.getIbBoardRenamedFilename());
			result=pstmt.executeUpdate();
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return result;
	}
	
	
//	public IbBoard selectBoard(Connection conn, int boardNo) {
//		PreparedStatement pstmt= null;
//		ResultSet rs=null;
//		IbBoard b =null;
//		try {
//			pstmt= conn.prepareStatement(prop.getProperty("selectBoard"));
//			pstmt.setInt(1, boardNo);
//			rs=pstmt.executeQuery();
//			if(rs.next()) b=getIbBoard(rs);
//		}catch(SQLException e) {
//			e.printStackTrace();
//		}finally {
//			close(rs);
//			close(pstmt);
//		}
//		return b;
//	}
//	public List<BoardComment> selectBoardCommentList(Connection conn,int boardNo){
//		PreparedStatement pstmt =null;
//		ResultSet rs = null;
//		List<BoardComment> result = new ArrayList();
//		try {
//			pstmt=conn.prepareStatement(prop.getProperty("selectBoardCommentList"));
//			pstmt.setInt(1, boardNo);
//			rs=pstmt.executeQuery();
//			while(rs.next())result.add(getBoardComment(rs));
//		}catch(SQLException e) {
//			e.printStackTrace();
//		}finally {
//			close(pstmt);
//			close(rs);
//		}
//		return result;
//	}
//	private  BoardComment getBoardComment(ResultSet rs) throws SQLException{
//		return BoardComment.builder()
//				.boardCommentNo(rs.getInt("board_comment_no"))
//				.boardCommentLevel(rs.getInt("board_comment_level"))
//				.boardCommentWriter(rs.getString("board_comment_writer"))
//				.boardCommentContent(rs.getString("board_comment_content"))
//				.boardCommentRef(rs.getInt("board_comment_ref"))
//				.boardRef(rs.getInt("board_ref"))
//				.boardCommentDate(rs.getDate("board_comment_date"))
//				.build();
//	}
	private IbBoard getIbBoard(ResultSet rs) throws SQLException {
		return IbBoard.builder()
				.ibPostNum(rs.getInt("ib_post_num"))
				.ibTitle(rs.getString("ib_title"))
				.ibEnrollDate(rs.getDate("ib_enroll_date"))
				.memberId(rs.getString("member_id"))
				.category(rs.getString("category"))
				.ibContent(rs.getString("ib_content"))
				.IbBoardOriginalFilename("ib_board_original_filename")
				.IbBoardRenamedFilename("ib_board_renamed_filename")
				.build();
				
//				.boardNo(rs.getInt("board_no"))
//				.boardTitle(rs.getString("board_title"))
//				.boardContent(rs.getString("board_content"))
//				.boardWriter(rs.getString("board_writer"))
//				.boardOriginalFilename(rs.getString("board_original_filename"))
//				.boardRenamedFilename(rs.getString("board_renamed_filename"))
//				.boardDate(rs.getDate("board_date"))
//				.boardReadCount(rs.getInt("board_readcount"))
//				.build();
	}
}
