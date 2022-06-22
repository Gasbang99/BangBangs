package com.bbs.payment.model.service;

import static com.bbs.common.JDBCTemplate.close;
import static com.bbs.common.JDBCTemplate.getConnection;

import java.sql.Connection;

import com.bbs.model.vo.Member;
import com.bbs.payment.model.dao.PaymentDao;
import com.bbs.payment.model.vo.PurchaseHistory;

public class PaymentService {
	private PaymentDao dao = new PaymentDao();

	public int insertPurchase (PurchaseHistory ph) {
		Connection conn = getConnection();
		int result = dao.insertPurchase(conn, ph);
		close(conn);
		return result;
	}
}
