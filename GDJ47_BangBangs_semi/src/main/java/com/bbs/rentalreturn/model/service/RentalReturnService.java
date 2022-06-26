package com.bbs.rentalreturn.model.service;

import static com.bbs.common.JDBCTemplate.close;
import static com.bbs.common.JDBCTemplate.getConnection;

import java.sql.Connection;
import java.util.List;

import com.bbs.model.vo.Bike;
import com.bbs.model.vo.BrokenReportHistory;
import com.bbs.model.vo.RentalHistory;
import com.bbs.payment.model.vo.PossessionTicket;
import com.bbs.rentalreturn.model.dao.RentalReturnDao;

public class RentalReturnService {
	private RentalReturnDao dao = new RentalReturnDao();
	
	public List<Bike> selectBike(String rentalshop) {
		Connection conn = getConnection();
		List<Bike> bikeList = dao.selectBike(conn, rentalshop);
		close(conn);
		return bikeList;
	}

	public int insertRentalHistory(RentalHistory rh) {
		Connection conn = getConnection();
		int result = dao.insertRentalHistory(conn, rh);
		close(conn);
		return result;
	}

	public int updateBikeRentalAvailability(int bikeId) {
		Connection conn = getConnection();
		int result = dao.updateBikeRentalAvailability(conn, bikeId);
		close(conn);
		return result;
	}


	public List<RentalHistory> selectRentalHistoryById(String memberId, int cPage, int numPerpage) {
		Connection conn = getConnection();
		List<RentalHistory> result = dao.selectRentalHistoryById(conn, memberId, cPage, numPerpage);
		close(conn);
		return result;
	}

	public int selectRentalHistoryCountById(String memberId) {
		Connection conn=getConnection();
		int result=dao.selectRentalHistoryCountById(conn, memberId);
		close(conn);
		return result;
	}
	public int updateMemberOnLoan(String id) {
		Connection conn = getConnection();
		int result = dao.updateMemberOnLoan(conn, id);
		close(conn);
		return result;
	}

	public int insertBrokenReportHistory(BrokenReportHistory brh) {
		Connection conn = getConnection();
		int result = dao.insertBrokenReportHistory(conn, brh);
		close(conn);
		return result;
	}

	public int updateReturnBikeBroken(String id, String rentalshop) {
		Connection conn = getConnection();
		int result = dao.updateReturnBikeBroken(conn, id, rentalshop);
		close(conn);
		return result;
	}

	public int updateReturnBikeNormal(String id, String rentalshop) {
		Connection conn = getConnection();
		int result = dao.updateReturnBikeNormal(conn, id, rentalshop);
		close(conn);
		return result;
	}

	public int updateReturnRentalHistory(String id) {
		Connection conn = getConnection();
		int result = dao.updateReturnRentalHistory(conn, id);
		close(conn);
		return result;
	}

	public int updateMemberOnLoanReturn(String id) {
		Connection conn = getConnection();
		int result = dao.updateMemberOnLoanReturn(conn, id);
		close(conn);
		return result;
	}

	public List<PossessionTicket> selectPossessionTicket(String memberId) {
		Connection conn = getConnection();
		List<PossessionTicket> result = dao.selectPossessionTicket(conn, memberId);
		close(conn);
		return result;
	}

	public int updatePossessionTicketActive(int psTicketId) {
		Connection conn = getConnection();
		int result = dao.updatePossessionTicketActive(conn, psTicketId);
		close(conn);
		return result;
	}

	public int updateBikeBrokenReport(int bikeId) {
		Connection conn = getConnection();
		int result = dao.updateBikeBrokenReport(conn, bikeId);
		close(conn);
		return result;
	}

	public int insertBrokenReportHistory2(BrokenReportHistory brh) {
		Connection conn = getConnection();
		int result = dao.insertBrokenReportHistory2(conn, brh);
		close(conn);
		return result;
	}

}
