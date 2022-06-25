package com.bbs.rentalreturn.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.bbs.model.vo.Member;
import com.bbs.model.vo.RentalHistory;
import com.bbs.rentalreturn.model.service.RentalReturnService;

/**
 * Servlet implementation class EnrollRentalHistoryServlet
 */
@WebServlet("/enrollrentalhistory.do")
public class EnrollRentalHistoryServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public EnrollRentalHistoryServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		String bikeId = request.getParameter("bike");
		
		HttpSession session = request.getSession();
		Member m = (Member) session.getAttribute("loginMember");
		String id = m.getMemberId();
		
		RentalHistory rh = RentalHistory.builder()
				.bikeId(Integer.parseInt(bikeId))
				.memberId(id)
				.build();
		
		int resultRH = new RentalReturnService().insertRentalHistory(rh);
		int resultBRA = new RentalReturnService().updateBikeRentalAvailability(Integer.parseInt(bikeId));
		
		String msg="";
		String loc="";
		if(resultRH>0&&resultBRA>0) {
			HttpSession session2 = request.getSession();
			session2.setAttribute("onLoanBike", Integer.parseInt(bikeId));
			msg = "대여 완료!";
			loc = "/";
		}else {
			msg="대여하기 실패. 다시 시도하세요.";
			loc="/rentalBike.do";
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
