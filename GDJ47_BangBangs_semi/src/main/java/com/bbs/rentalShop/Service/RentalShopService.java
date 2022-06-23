package com.bbs.rentalShop.Service;

import static com.bbs.common.JDBCTemplate.close;
import static com.bbs.common.JDBCTemplate.getConnection;

import java.sql.Connection;
import java.util.List;

import com.bbs.model.vo.RentalShop;
import com.bbs.rentalShop.Dao.RentalShopDao;

public class RentalShopService {

	private RentalShopDao dao=new RentalShopDao();
	
	
	public List<RentalShop> selectMemberList(){
		Connection conn=getConnection();
		List<RentalShop> result=dao.selectRentalShopList(conn);
		close(conn);
		return result;
	}
}
