package com.bbs.rentalreturn.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bbs.model.vo.Bike;
import com.bbs.rentalreturn.model.service.RentalReturnService;
import com.google.gson.Gson;

/**
 * Servlet implementation class FindBikeServlet
 */
@WebServlet("/findbike.do")
public class FindBikeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public FindBikeServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		String rentalshop = request.getParameter("rentalshop");
		
		List<Bike> bikeList = new RentalReturnService().selectBike(rentalshop);
		
		Gson gson = new Gson();
		
		response.setContentType("application/json;charset=utf-8");
		
		gson.toJson(bikeList, response.getWriter());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
