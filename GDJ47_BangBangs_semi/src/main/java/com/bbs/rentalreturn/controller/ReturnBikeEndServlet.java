package com.bbs.rentalreturn.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.bbs.model.vo.BrokenReportHistory;
import com.bbs.model.vo.Member;
import com.bbs.rentalreturn.model.service.RentalReturnService;

/**
 * Servlet implementation class ReturnBikeEndServlet
 */
@WebServlet("/returnBikeEnd.do")
public class ReturnBikeEndServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ReturnBikeEndServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		String rentalshop = request.getParameter("rentalshop");
		
		HttpSession session = request.getSession();
		Member m = (Member) session.getAttribute("loginMember");
		String id = m.getMemberId();
		
		String brokenReport = request.getParameter("brokenReport");
		int resultB;
		int resultBRH = 0;
		if(brokenReport!=null) {
			String[] brokenArea = request.getParameterValues("brokenArea");
			String brokenContent = request.getParameter("brokenContent");
			BrokenReportHistory brh = BrokenReportHistory.builder()
					.brokenReportTitle(String.join("/", brokenArea))
					.brokenReportContent(brokenContent)
					.memberId(id)
					.build();
			resultBRH = new RentalReturnService().insertBrokenReportHistory(brh);
			resultB = new RentalReturnService().updateReturnBikeBroken(id, rentalshop);
		}else {
			resultB = new RentalReturnService().updateReturnBikeNormal(id, rentalshop);
		}
		int resultRH = new RentalReturnService().updateReturnRentalHistory(id);
		int resultM = new RentalReturnService().updateMemberOnLoanReturn(id);
		
		String msg="";
		String loc="";
		if(resultRH>0&&resultM>0&&resultB>0) {
			session.setAttribute("onloan", "offloan");
			msg = "반납 완료!";
			loc = "/";
		}else {
			msg="반납하기 실패. 다시 시도하세요.";
			loc="/returnBike.do";
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
