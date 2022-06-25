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

}
