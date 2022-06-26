package com.bbs.rentalreturn.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.bbs.model.service.MemberService;
import com.bbs.model.vo.BrokenReportHistory;
import com.bbs.model.vo.Member;
import com.bbs.rentalreturn.model.service.RentalReturnService;

/**
 * Servlet implementation class BrokenReportEndServlet
 */
@WebServlet("/brokenReportEnd.do")
public class BrokenReportEndServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BrokenReportEndServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		HttpSession session = request.getSession();
		Member m = (Member) session.getAttribute("loginMember");
		String id = m.getMemberId();
		
		int bikeId = Integer.parseInt(request.getParameter("bike"));
		
		String[] brokenArea = request.getParameterValues("brokenArea");
		String brokenContent = request.getParameter("brokenContent");
		BrokenReportHistory brh = BrokenReportHistory.builder()
				.brokenReportTitle(String.join("/", brokenArea))
				.brokenReportContent(brokenContent)
				.bikeId(bikeId)
				.memberId(id)
				.build();
		int resultBRH = new RentalReturnService().insertBrokenReportHistory2(brh);
		int resultB = new RentalReturnService().updateBikeBrokenReport(bikeId);
		
		String msg="";
		String loc="";
		if(resultBRH>0&&resultB>0) {
			msg = "고장신고 완료!";
			loc = "/";
		}else {
			msg="고장신고 실패. 다시 시도하세요.";
			loc="/brokenReport.do";
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
