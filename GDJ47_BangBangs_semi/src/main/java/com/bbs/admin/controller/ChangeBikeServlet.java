package com.bbs.admin.controller;

import java.io.IOException;
import java.text.SimpleDateFormat;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.bbs.bike.service.AdminBikeService;
import com.bbs.model.vo.Bike;

/**
 * Servlet implementation class ChangeBikeServlet
 */
@WebServlet("/admin/changeBike.do")
public class ChangeBikeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ChangeBikeServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		Bike b=new Bike();
		b.setBikeId(Integer.parseInt(request.getParameter("bikeId")));
		b.setBikeBrokenStatus(request.getParameter("brokenStatus"));
		b.setRentalShopId(Integer.parseInt(request.getParameter("rentalShop")));
		b.setRentalAvailability(request.getParameter("Availability"));
		
		int result=new AdminBikeService().updateBike(b);
		
		String msg="",loc="";
		
		loc="/admin/bikeManagement.do?bike_Id="+b.getBikeId();
		if(result>0) {
			msg="정상적으로 정보가 수정되었습니다";
			//session에 저장된 로인정보도변경
			HttpSession session=request.getSession();
			session.setAttribute("selectBike", b);
			//session.setAttribute("loginMember", new MemberService().selectMemberById(m.getUserId()));
		}else {
			msg="정보수정을 실패했습니다.";			
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
