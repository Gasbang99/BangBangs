package com.bbs.payment.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.bbs.model.service.MemberService;
import com.bbs.model.vo.Member;
import com.bbs.payment.model.service.PaymentService;
import com.bbs.payment.model.vo.GiftHistory;
import com.bbs.payment.model.vo.PurchaseHistory;

/**
 * Servlet implementation class EnrollGiftHistoryServlet
 */
@WebServlet("/enrollgifthistory.do")
public class EnrollGiftHistoryServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	private GiftHistory gh;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public EnrollGiftHistoryServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		String takeMemberId = request.getParameter("giftid");
		
		String ticketCode = request.getParameter("comPaymentClsCd");
		int mileageDeduction = Integer.parseInt(request.getParameter("TOT_AMOUNT2"));
		String paymentMethod = request.getParameter("pay");
		int paymentAmount = Integer.parseInt(request.getParameter("TOT_AMOUNT3"));
		int mileageSave = (int)Math.floor(paymentAmount*0.05);
		HttpSession session = request.getSession();
		Member m = (Member) session.getAttribute("loginMember");
		String id = m.getMemberId();	
		
		PurchaseHistory ph = new PurchaseHistory();
		ph.setTicketCode(ticketCode);
		ph.setMileageDeduction(mileageDeduction);
		ph.setPaymentAmount(paymentAmount);
		ph.setPurchaseMethod(paymentMethod);
		ph.setMemberId(id);
		ph.setMileageSave(mileageSave);
		
		GiftHistory gh = new GiftHistory();
		gh.setGiveMemberId(id);
		gh.setTakeMemberId(takeMemberId);
		gh.setTicketCode(ticketCode);
		
		int resultPH = new PaymentService().insertPurchase(ph);
		int resultGH = new PaymentService().insertGiftHistory(gh);
		
		int resultMM=0;
		if(resultPH>0) {
			resultMM = new MemberService().updateMemberMileage(mileageSave ,mileageDeduction, id);
		}
		
		String msg = "", loc = "";
	      
	      if(resultPH>0&&resultMM>0) {
	         msg = "결제가 완료되었습니다!";
	         loc = "/member.do";
	      }else {
	         msg = "결제가 실패했습니다. 다시 시도하세요.";
	         loc = "/member.do";
	      }
	      
	      request.setAttribute("msg", msg);
	      request.setAttribute("loc", loc);
	      
	      request.getRequestDispatcher("/views/common/msg.jsp").forward(request, response);
	}
	
	

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
