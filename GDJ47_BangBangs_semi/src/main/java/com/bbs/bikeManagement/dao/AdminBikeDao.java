package com.bbs.bikeManagement.dao;

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

import com.bbs.adminMember.dao.AdminDao;
import com.bbs.model.vo.Bike;
import com.bbs.model.vo.Member;

public class AdminBikeDao {

private Properties prop=new Properties();
	
	public AdminBikeDao() {
		String path=AdminBikeDao.class.getResource("/sql/bike_sql.properties").getPath();
		try {
			prop.load(new FileReader(path));
		}catch(IOException e) {
			e.printStackTrace();
		}
	}
	
	public List<Bike> selectBikeList(Connection conn,int cPage, int numPerpage){
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		List<Bike> list=new ArrayList();
		try {
			pstmt=conn.prepareStatement(prop.getProperty("selectBikeList"));
			
			 pstmt.setInt(1, (cPage-1)*numPerpage+1);
			 pstmt.setInt(2, cPage*numPerpage);
			 
			rs=pstmt.executeQuery();
			while(rs.next()) {
//				Bike m=BikeDao.getBike(rs);
//				list.add(m);
				list.add(getBike(rs));
			}
			
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}return list;
	}
	
	
	public int selectBikeCount(Connection conn) {
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		int result=0;
		try {
			pstmt=conn.prepareStatement(prop.getProperty("selectBikeCount"));
			rs=pstmt.executeQuery();
			if(rs.next()) result=rs.getInt(1);
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}return result;
	}
	
	
	public List<Bike> searchBikeList(Connection conn, String type, String  keyword,
				int cPage, int numPerpage){
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		List<Bike> result=new ArrayList();
		String sql=prop.getProperty("searchBike");
		sql=sql.replace("$COL", type);
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, type.equals("Bike_NAME")?"%"+keyword+"%":keyword);
			pstmt.setInt(2, (cPage-1)*numPerpage+1);
			pstmt.setInt(3, cPage*numPerpage);
			rs=pstmt.executeQuery();
			while(rs.next()) {
				result.add(getBike(rs));
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}return result;
	}
	
	public int searchBikeCount(Connection conn, String type, String keyword) {
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		String sql=prop.getProperty("searchBikeCount").replace("$COL",type);
		int result=0;
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, type.equals("BIKE_NAME")?"%"+keyword+"%":keyword);
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
			pstmt=conn.prepareStatement("SELECT BIKE_ID FROM Bike WHERE BIKE_ID LIKE '%"+keyword+"%'");
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
	
	private Bike getBike(ResultSet rs) {
		Bike b=null;
		try {
			b=new Bike();
			b.setBikeId(rs.getInt("BIKE_ID"));
			b.setBikeStatus(rs.getString("BIKE_BROKEN_STATUS"));
			b.setBikeEnollDate(rs.getDate("BIKE_ENROLL_DATE"));
			b.setRentalShopId(rs.getInt("RENTAL_SHOP_ID"));
			b.setRentalAvail(rs.getString("RENTAL_AVAILABILITY"));
		}catch(SQLException e) {
			e.printStackTrace();
		}
		return b;
	}
}
