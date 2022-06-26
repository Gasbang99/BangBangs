package com.bbs.admin.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bbs.bike.service.AdminBikeService;
import com.bbs.model.service.MemberService;
import com.bbs.model.vo.Bike;
import com.bbs.model.vo.Member;

/**
 * Servlet implementation class BikeDetailServlet
 */
@WebServlet("/admin/BikeDetail.do")
public class BikeDetailServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BikeDetailServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String bikeId=request.getParameter("bikeId");
		Bike b= new AdminBikeService().selectBikeById(bikeId);
		request.setAttribute("bike", b);			
		request.getRequestDispatcher("/views/admin_views/bikeManagement/bikeDetail.jsp").forward(request, response);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
