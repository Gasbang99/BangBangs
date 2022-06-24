package com.bbs.payment.model.dao;

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
import com.bbs.payment.model.vo.GiftHistory;
import com.bbs.payment.model.vo.PossessionTicket;
import com.bbs.payment.model.vo.PurchaseHistory;
import com.bbs.payment.model.vo.Ticket;

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
			pstmt.setString(1, ph.getPurchaseMethod());
			pstmt.setInt(2, ph.getPaymentAmount());
			pstmt.setInt(3, ph.getMileageSave());
			pstmt.setInt(4, ph.getMileageDeduction());
			pstmt.setString(5, ph.getTicketCode());
			pstmt.setString(6, ph.getMemberId());
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
	public List<PurchaseHistory> selectPurchaseHistoryById(Connection conn, String memberId, int cPage,
			int numPerpage) {
		PreparedStatement pstmt=null;
		List<PurchaseHistory> result= new ArrayList();
		ResultSet rs = null;
		try {
			pstmt = conn.prepareStatement(prop.getProperty("selectPurchaseHistoryById"));
			pstmt.setString(1, memberId);
			pstmt.setInt(2, (cPage-1)*numPerpage+1);
			pstmt.setInt(3, cPage*numPerpage);
			rs=pstmt.executeQuery();
			while(rs.next()) {
				result.add(getPhBoard(rs));
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}
		return result;
	}
	
	
	
	private PurchaseHistory getPhBoard(ResultSet rs) throws SQLException {
		return PurchaseHistory.builder()
				.purchaseId(rs.getInt("purchase_id"))
				.purchaseMethod(rs.getString("payment_method"))
				.paymentAmount(rs.getInt("payment_amount"))
				.purchaseDate(rs.getDate("purchase_date"))
				.mileageSave(rs.getInt("mileage_save"))
				.mileageDeduction(rs.getInt("mileage_deduction"))
				.ticketCode(rs.getString("ticket_code"))
				.memberId(rs.getString("member_id"))
				.build();
	}
	public Ticket findTicketNameByTicketCode(Connection conn, String ticketCode) {
		PreparedStatement pstmt=null;
		Ticket ticket=null;
		ResultSet rs = null;
		try {
			pstmt = conn.prepareStatement(prop.getProperty("findTicketNameByTicketCode"));
			pstmt.setString(1, ticketCode);
			rs=pstmt.executeQuery();
			if(rs.next()) ticket=getTicket(rs);
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}
		return ticket;
	}
	private Ticket getTicket(ResultSet rs) throws SQLException {
		return Ticket.builder()
				.ticketCode(rs.getString("ticket_Code"))
				.ticketName(rs.getString("ticket_Name"))
				.timeLimit(rs.getInt("time_Limit"))
				.dateLimit(rs.getInt("date_Limit"))
				.ticketPrice(rs.getInt("ticket_Price"))
				.build();
	}
	public int selectIPurchaseHistoryCountById(Connection conn, String memberId) {
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		int result=0;
		try {
			pstmt=conn.prepareStatement(prop.getProperty("selectIPurchaseHistoryCountById"));
			pstmt.setString(1, memberId);
			rs=pstmt.executeQuery();
			if(rs.next()) result=rs.getInt(1);
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}return result;
	}
	public int insertGiftHistory(Connection conn, GiftHistory gh) {
		PreparedStatement pstmt = null;
		int result = 0;		
		try {
			pstmt = conn.prepareStatement(prop.getProperty("insertGiftHistory"));
			pstmt.setString(1, gh.getGiveMemberId());
			pstmt.setString(2, gh.getTakeMemberId());
			pstmt.setString(3, gh.getTicketCode());
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
	
	public int insertPossessionTicket(Connection conn, PossessionTicket pt) {
		PreparedStatement pstmt = null;
		int result = 0;		
		try {
			pstmt = conn.prepareStatement(prop.getProperty("insertPossessionTicket"));
			pstmt.setString(1, pt.getPsTicketCode());
			pstmt.setString(2, pt.getMemberId());
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

