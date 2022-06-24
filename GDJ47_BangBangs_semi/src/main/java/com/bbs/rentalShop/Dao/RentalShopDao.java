package com.bbs.rentalShop.Dao;

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
import com.bbs.model.dao.MemberDao;
import com.bbs.model.vo.Member;
import com.bbs.model.vo.RentalShop;

import oracle.net.aso.r;

public class RentalShopDao {

	private Properties prop=new Properties();

	public RentalShopDao() {
		String path=RentalShopDao.class.getResource("/sql/rentalShop.properties").getPath();
		try {
			prop.load(new FileReader(path));
		}catch(IOException e) {
			e.printStackTrace();
		}
	}
	
	public List<RentalShop> selectRentalShopList(Connection conn){
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		List<RentalShop> list=new ArrayList();
		
		try {
			
			pstmt=conn.prepareStatement(prop.getProperty("selectRentalShopList"));
			rs=pstmt.executeQuery();
			
			while(rs.next()) {
				RentalShop r= new RentalShop();
				r.setRentalShopId(rs.getInt("RENTAL_SHOP_ID"));
				r.setRentalShopName(rs.getString("RENTAL_SHOP_NAME"));
				r.setLatitude(rs.getDouble("LATITUDE"));
				r.setLongitude(rs.getDouble("LONGITUDE"));
				r.setRentalShopAddress(rs.getString("RENTAL_SHOP_ADDRESS"));
				list.add(r);
			}
			
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}return list;
	}
	
	
}
