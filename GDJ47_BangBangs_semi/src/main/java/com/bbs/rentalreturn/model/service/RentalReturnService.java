package com.bbs.rentalreturn.model.service;

import static com.bbs.common.JDBCTemplate.close;
import static com.bbs.common.JDBCTemplate.getConnection;

import java.sql.Connection;
import java.util.List;

import com.bbs.model.vo.Bike;
import com.bbs.rentalreturn.model.dao.RentalReturnDao;

public class RentalReturnService {
	private RentalReturnDao dao = new RentalReturnDao();
	
	public List<Bike> selectBike(String rentalshop) {
		Connection conn = getConnection();
		List<Bike> bikeList = dao.selectBike(conn, rentalshop);
		close(conn);
		return bikeList;
	}

}
