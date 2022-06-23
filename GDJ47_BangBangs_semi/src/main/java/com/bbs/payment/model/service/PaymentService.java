package com.bbs.payment.model.service;

import static com.bbs.common.JDBCTemplate.close;
import static com.bbs.common.JDBCTemplate.getConnection;

import java.sql.Connection;
import java.util.List;

import com.bbs.model.vo.Member;
import com.bbs.payment.model.dao.PaymentDao;
import com.bbs.payment.model.vo.PurchaseHistory;
import com.bbs.payment.model.vo.Ticket;

public class PaymentService {
	private PaymentDao dao = new PaymentDao();

	public int insertPurchase (PurchaseHistory ph) {
		Connection conn = getConnection();
		int result = dao.insertPurchase(conn, ph);
		close(conn);
		return result;
	}

	public List<PurchaseHistory> selectPurchaseHistoryById(String memberId, int cPage, int numPerpage) {
		Connection conn=getConnection();
		List<PurchaseHistory> result=dao.selectPurchaseHistoryById(conn,memberId,cPage,numPerpage);
		close(conn);
		return result;
	}

	public String findTicketNameByTicketCode(String ticketCode) {
		Connection conn = getConnection();
		Ticket ticketData = dao.findTicketNameByTicketCode(conn, ticketCode);
		String name=ticketData.getTicketName();
		close(conn);
		return name;
	}

	public int selectIPurchaseHistoryCountById(String memberId) {
		Connection conn=getConnection();
		int result=dao.selectIPurchaseHistoryCountById(conn, memberId);
		close(conn);
		return result;
	}
}
