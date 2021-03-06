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

import com.bbs.model.dao.MemberDao;
import com.bbs.model.vo.IbBoard;
import com.bbs.model.vo.IbBoardComment;
import com.bbs.model.vo.Member;




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
			pstmt.setString(4, b.getIbBoardOriginalFilename());
			pstmt.setString(5, b.getIbBoardRenamedFilename());
			pstmt.setString(6, b.getIbContent());
			result=pstmt.executeUpdate();
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return result;
	}
	
	
	public IbBoard selectBoard(Connection conn, int boardNo) {
		PreparedStatement pstmt= null;
		ResultSet rs=null;
		IbBoard b =null;
		try {
			pstmt= conn.prepareStatement(prop.getProperty("selectBoard"));
			pstmt.setInt(1, boardNo);
			rs=pstmt.executeQuery();
			
			if(rs.next()) b=getIbBoard(rs);
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}
		return b;
	}
	public int insertBoardComment(Connection conn,IbBoardComment ibc) {
		PreparedStatement pstmt = null;
		int result = 0;
		try {
			pstmt=conn.prepareStatement(prop.getProperty("insertBoardComment"));
			pstmt.setInt(1, ibc.getIbPostNum());
			pstmt.setString(2, ibc.getIbCommentContent());
			pstmt.setString(3, ibc.getIbCommentWriter());
			result=pstmt.executeUpdate();
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return result;
	}
	public int updateMember(Connection conn,IbBoard b) {
		PreparedStatement pstmt = null;
		
		int result = 0;
		try {
			pstmt = conn.prepareStatement(prop.getProperty("updateMember"));
			pstmt.setString(1, b.getIbTitle());
			pstmt.setString(2, b.getIbContent());
			pstmt.setString(3, b.getIbBoardOriginalFilename());
			pstmt.setString(4, b.getIbBoardRenamedFilename());
			pstmt.setInt(5, b.getIbPostNum());
			result=pstmt.executeUpdate();
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return result;
	}
	public int deleteBoard(Connection conn,int boardNo) {
		PreparedStatement pstmt= null;
		ResultSet rs=null;
		int result = 0;
		try {
			pstmt= conn.prepareStatement(prop.getProperty("deleteBoard"));
			pstmt.setInt(1, boardNo);
			result=pstmt.executeUpdate();
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}
		return result;
	}
	public List<String> searchMemberId(Connection conn,String keyword){
		PreparedStatement pstmt = null;
		ResultSet rs =null;
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
		}
		return result;
	}
	public List<IbBoard> searchIbBoardList(Connection conn,String type,String keyword,int cPage,int numPerpage){
		PreparedStatement pstmt = null;
		ResultSet rs =null;
		List<IbBoard> result = new ArrayList();
		String sql=prop.getProperty("searchIbBoardList");
		sql=sql.replace("$COL", type);
		try {
			pstmt = conn.prepareStatement(sql);
//			pstmt.setString(1,keyword);
			//????????????
			pstmt.setString(1, type.equals("memberId")?"%"+keyword+"%":keyword);
			pstmt.setInt(2, (cPage-1)*numPerpage+1);
			pstmt.setInt(3, cPage*numPerpage);
			rs = pstmt.executeQuery();
			while(rs.next())result.add(getIbBoard(rs));
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}
		return result;
	}
	public int searchIbBoardCount(Connection conn,String type,String keyword) {
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		String sql=prop.getProperty("searchIbBoardCount").replace("$COL", type);
		int result=0;
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, type.equals("memberId")?"%"+keyword+"%":keyword);
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

	private Member getMember(ResultSet rs) throws SQLException{
		return Member.builder()
				.memberId(rs.getString("member_id"))
				.memberPassword(rs.getString("member_password"))
				.memberName(rs.getString("member_name"))
				.gender(rs.getString("gender"))
				.birthday(rs.getString("birthday"))
				.email(rs.getString("email"))
				.address(rs.getString("address"))
				.phone(rs.getString("phone"))
				.enrollDate(rs.getDate("enroll_date"))
				.memberLevel(rs.getString("member_level"))
				.totalMileage(rs.getInt("total_mileage"))
				.build();
	}
	public List<IbBoardComment> selectIbBoardCommentList(Connection conn,int boardNo){
		PreparedStatement pstmt =null;
	    ResultSet rs = null;
		List<IbBoardComment> result = new ArrayList();
		try {
			pstmt=conn.prepareStatement(prop.getProperty("selectIbBoardCommentList"));
			pstmt.setInt(1, boardNo);
			rs=pstmt.executeQuery();
			while(rs.next())result.add(getIbBoardComment(rs));
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
			close(rs);
		}
		return result;
	}
	public int deleteBoardComment(Connection conn,int boardNo) {
		PreparedStatement pstmt= null;
		ResultSet rs=null;
		int result = 0;
		try {
			pstmt= conn.prepareStatement(prop.getProperty("deleteBoardComment"));
			pstmt.setInt(1, boardNo);
			result=pstmt.executeUpdate();
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}
		return result;
	}
	private  IbBoardComment getIbBoardComment(ResultSet rs) throws SQLException{
		return IbBoardComment.builder()
				.IbCommentNum(rs.getInt("ib_comment_num"))
				.IbCommentContent(rs.getString("ib_comment_content"))
				.IbCommentWriter(rs.getString("ib_comment_writer"))
				.IbPostNum(rs.getInt("ib_post_num"))
				.IbCommentEnrollDate(rs.getDate("ib_comment_enroll_date"))
				.build();
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
}
