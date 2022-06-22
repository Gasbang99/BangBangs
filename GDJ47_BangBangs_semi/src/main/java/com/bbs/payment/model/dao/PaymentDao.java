package com.bbs.payment.model.dao;

import static com.bbs.common.JDBCTemplate.close;
import static com.bbs.common.JDBCTemplate.commit;
import static com.bbs.common.JDBCTemplate.rollback;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.Properties;

import com.bbs.model.dao.MemberDao;
import com.bbs.payment.model.vo.PurchaseHistory;

public class PaymentDao {
private Properties prop=new Properties();
	
	public PaymentDao() {
		String path=MemberDao.class.getResource("/sql/purchase_sql.properties").getPath();
		try {
			prop.load(new FileReader(path));
		}catch(IOException e) {
			e.printStackTrace();
		}
	}
	public int insertPurchase(Connection conn, PurchaseHistory ph) {
		PreparedStatement pstmt = null;
		int result = 0;		
		try {
			pstmt = conn.prepareStatement(prop.getProperty("insertPurchase"));
			pstmt.setInt(1, ph.getPurchaseId());
			pstmt.setString(2, ph.getPurchaseMethod());
			pstmt.setInt(3, ph.getPaymentAmount());
			pstmt.setDate(4, ph.getPurchaseDate());
			pstmt.setInt(5, ph.getMileageSave());
			pstmt.setInt(6, ph.getMileageDeduction());
			pstmt.setString(7, ph.getTicketCode());
			pstmt.setString(8, ph.getMemberId());
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

