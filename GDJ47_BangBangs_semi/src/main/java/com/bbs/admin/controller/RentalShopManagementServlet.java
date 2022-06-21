package com.bbs.admin.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bbs.model.vo.RentalShop;
import com.bbs.rentalShop.Service.RentalShopService;
import com.google.gson.Gson;

/**
 * Servlet implementation class RentalShopManagementServlet
 */
@WebServlet("/searchrentalshop.do")
public class RentalShopManagementServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RentalShopManagementServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		List<RentalShop> list=new RentalShopService().selectMemberList();
		
		for(RentalShop r : list) {
			System.out.println(r);
		}
		
		response.setContentType("application/json;charset=utf-8");
		
		String data=new Gson().toJson(list);
		
		System.out.println(data);
		response.getWriter().print(data);
		
		request.getRequestDispatcher("/views/admin_views/rentalShopManagement/rentalShopMap.jsp")
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
