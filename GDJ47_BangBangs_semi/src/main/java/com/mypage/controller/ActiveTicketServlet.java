package com.mypage.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.bbs.payment.model.service.PaymentService;

/**
 * Servlet implementation class ActiveTicketServlet
 */
@WebServlet("/activeTicket.do")
public class ActiveTicketServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ActiveTicketServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int psTicketId=Integer.parseInt(request.getParameter("psTicketId"));
		String memberId= request.getParameter("memberId");
		
		String msg="",loc="";
		int result=0;
		try {
			result=new PaymentService().activePsTicketBypsTicketId(psTicketId);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		loc="/possessionHistory.do?memberId="+memberId;
		if(result>0) {
			msg="이용권이 활성화되었습니다";	
		}else {
			msg="이용권활성화를 실패했습니다";			
		}
		request.setAttribute("msg", msg);
		request.setAttribute("loc", loc);
		
		request.getRequestDispatcher("/views/common/msg.jsp")
		.forward(request, response);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
