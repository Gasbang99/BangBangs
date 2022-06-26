package com.bbs.payment.model.service;

import static com.bbs.common.JDBCTemplate.close;
import static com.bbs.common.JDBCTemplate.commit;
import static com.bbs.common.JDBCTemplate.getConnection;
import static com.bbs.common.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.List;

import com.bbs.payment.model.dao.PaymentDao;
import com.bbs.payment.model.vo.GiftHistory;
import com.bbs.payment.model.vo.PossessionTicket;
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

	public int insertGiftHistory(GiftHistory gh) {
		Connection conn = getConnection();
		int result = dao.insertGiftHistory(conn, gh);
		close(conn);
		return result;
	}
	
	public int insertPossessionTicket(PossessionTicket pt) {
		Connection conn = getConnection();
		int result = dao.insertPossessionTicket(conn, pt);
		close(conn);
		return result;
	}

	public List<PossessionTicket> selectPsTicketListById(String memberId, int cPage, int numPerpage) {
		Connection conn=getConnection();
		List<PossessionTicket> result=dao.selectPsTicketListById(conn,memberId,cPage,numPerpage);
		close(conn);
		return result;
	}

	public int selectPsTicketCountById(String memberId) {
		Connection conn=getConnection();
		int result=dao.selectPsTicketCountById(conn, memberId);
		close(conn);
		return result;
	}

	public int activePsTicketBypsTicketId(int psTicketId) {
		Connection conn=getConnection();
		int result=dao.activePsTicketBypsTicketId(conn, psTicketId);
		if(result>0) commit(conn);
		else rollback(conn);
		close(conn);
		return result;
	}

	public List<GiftHistory> selectTakeGiftListById(String memberId, int cPage, int numPerpage) {
		Connection conn=getConnection();
		List<GiftHistory> result=dao.selectTakeGiftListById(conn,memberId,cPage,numPerpage);
		close(conn);
		return result;
	}

	public int selectTakeGiftCountById(String memberId) {
		Connection conn=getConnection();
		int result=dao.selectTakeGiftCountById(conn, memberId);
		close(conn);
		return result;
	}

	public List<GiftHistory> selectGiveGiftListById(String memberId, int cPage, int numPerpage) {
		Connection conn=getConnection();
		List<GiftHistory> result=dao.selectGiveGiftListById(conn,memberId,cPage,numPerpage);
		close(conn);
		return result;
	}

	public int selectGiveGiftCountById(String memberId) {
		Connection conn=getConnection();
		int result=dao.selectGiveGiftCountById(conn, memberId);
		close(conn);
		return result;
	}

	
	
}
