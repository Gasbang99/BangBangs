package com.bbs.payment.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.bbs.model.vo.Member;
import com.bbs.payment.model.service.PaymentService;
import com.bbs.payment.model.vo.PurchaseHistory;

/**
 * Servlet implementation class EnrollPurchaseHistoryServlet
 */
@WebServlet("/enrollpurchasehistory.do")
public class EnrollPurchaseHistoryServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public EnrollPurchaseHistoryServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		String ticketCode = request.getParameter("comPaymentClsCd");
		int mileageDeduction = Integer.parseInt(request.getParameter("TOT_AMOUNT2"));
		String paymentMethod = request.getParameter("pay");
		int paymentAmount = Integer.parseInt(request.getParameter("TOT_AMOUNT3"));
		HttpSession session = request.getSession();
		Member m = (Member) session.getAttribute("loginmember");
		String id = m.getMemberId();
		
		PurchaseHistory ph = new PurchaseHistory();
		ph.setTicketCode(ticketCode);
		ph.setMileageDeduction(mileageDeduction);
		ph.setPaymentAmount(paymentAmount);
		ph.setPurchaseMethod(paymentMethod);
		ph.setMemberId(id);
		
		int result = new PaymentService().insertPurchase(ph);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
