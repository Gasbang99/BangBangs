package com.bbs.rentalreturn.model.dao;

import static com.bbs.common.JDBCTemplate.close;
import static com.bbs.common.JDBCTemplate.commit;
import static com.bbs.common.JDBCTemplate.rollback;

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
import com.bbs.model.vo.Bike;
import com.bbs.model.vo.BrokenReportHistory;
import com.bbs.model.vo.RentalHistory;

public class RentalReturnDao {
	private Properties prop=new Properties();
	
	public RentalReturnDao() {
		String path=MemberDao.class.getResource("/sql/rentalreturn_sql.properties").getPath();
		try {
			prop.load(new FileReader(path));
		}catch(IOException e) {
			e.printStackTrace();
		}
	}

	public List<Bike> selectBike(Connection conn, String rentalshop) {
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		List<Bike> bikeList=new ArrayList();
		try {
			pstmt=conn.prepareStatement(prop.getProperty("selectBike"));
			pstmt.setString(1, rentalshop);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				bikeList.add(getBike(rs));
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}return bikeList;
	}
	
	private Bike getBike(ResultSet rs) throws SQLException{
		return Bike.builder()
				.bikeId(rs.getInt("bike_id"))
				.bikeBrokenStatus(rs.getString("bike_broken_status"))
				.bikeEnrollDate(rs.getDate("bike_enroll_date"))
				.rentalShopId(rs.getInt("rental_shop_id"))
				.rentalAvailability(rs.getString("rental_availability"))
				.build();
	}
	private RentalHistory getRentalHis(ResultSet rs) throws SQLException{
		return RentalHistory.builder()
				.rentalId(rs.getInt("rental_id"))
				.bikeId(rs.getInt("bike_id"))
				.memberId(rs.getString("member_id"))
				.rentalStartTime(rs.getDate("rental_start_time"))
				.rentalReturnTime(rs.getDate("rental_return_time"))
				.rentalUsedTime(rs.getInt("rental_used_time"))
				.build();
	}

	public int insertRentalHistory(Connection conn, RentalHistory rh) {
		PreparedStatement pstmt = null;
		int result = 0;
		try {
			pstmt = conn.prepareStatement(prop.getProperty("insertRentalHistory"));
			pstmt.setInt(1, rh.getBikeId());
			pstmt.setString(2, rh.getMemberId());
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

	public int updateBikeRentalAvailability(Connection conn, int bikeId) {
		PreparedStatement pstmt = null;
		int result = 0;
		try {
			pstmt = conn.prepareStatement(prop.getProperty("updateBikeRentalAvailability"));
			pstmt.setInt(1, bikeId);
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

	public List<RentalHistory> selectRentalHistoryById(Connection conn, String memberId, int cPage, int numPerpage) {
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		List<RentalHistory> rentalHistory=new ArrayList();
		try {
			pstmt=conn.prepareStatement(prop.getProperty("selectRentalHistoryById"));
			pstmt.setString(1, memberId);
			pstmt.setInt(2, (cPage-1)*numPerpage+1);
			pstmt.setInt(3, cPage*numPerpage);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				rentalHistory.add(getRentalHis(rs));
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}return rentalHistory;
	}

	public int selectRentalHistoryCountById(Connection conn, String memberId) {
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		int result=0;
		try {
			pstmt=conn.prepareStatement(prop.getProperty("selectRentalHistoryCountById"));
			pstmt.setString(1, memberId);
			rs=pstmt.executeQuery();
			if(rs.next()) result=rs.getInt(1);
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}return result;
	}

	public int updateMemberOnLoan(Connection conn, String id) {
		PreparedStatement pstmt = null;
		int result = 0;
		try {
			pstmt = conn.prepareStatement(prop.getProperty("updateMemberOnLoan"));
			pstmt.setString(1, id);
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

	public int insertBrokenReportHistory(Connection conn, BrokenReportHistory brh) {
		PreparedStatement pstmt = null;
		int result = 0;
		try {
			pstmt = conn.prepareStatement(prop.getProperty("insertBrokenReportHistory"));
			pstmt.setString(1, brh.getBrokenReportTitle());
			pstmt.setString(2, brh.getBrokenReportContent());
			pstmt.setString(3, brh.getMemberId());
			pstmt.setString(4, brh.getMemberId());
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

	public int updateReturnBikeBroken(Connection conn, String id, String rentalshop) {
		PreparedStatement pstmt = null;
		int result = 0;
		try {
			pstmt = conn.prepareStatement(prop.getProperty("updateReturnBikeBroken"));
			pstmt.setString(1, "고장");
			pstmt.setString(2, rentalshop);
			pstmt.setString(3, id);
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

	public int updateReturnBikeNormal(Connection conn, String id, String rentalshop) {
		PreparedStatement pstmt = null;
		int result = 0;
		try {
			pstmt = conn.prepareStatement(prop.getProperty("updateReturnBikeNormal"));
			pstmt.setString(1, rentalshop);
			pstmt.setString(2, id);
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

	public int updateReturnRentalHistory(Connection conn, String id) {
		PreparedStatement pstmt = null;
		int result = 0;
		try {
			pstmt = conn.prepareStatement(prop.getProperty("updateReturnRentalHistory"));
			pstmt.setString(1, id);
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

	public int updateMemberOnLoanReturn(Connection conn, String id) {
		PreparedStatement pstmt = null;
		int result = 0;
		try {
			pstmt = conn.prepareStatement(prop.getProperty("updateMemberOnLoanReturn"));
			pstmt.setString(1, id);
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

}
