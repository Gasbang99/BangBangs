package com.bbs.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bbs.model.service.MemberService;
import com.google.gson.Gson;

/**
 * Servlet implementation class UpdateTemporaryPasswordServlet
 */
@WebServlet(name = "updateTempoPwServlet",urlPatterns = "/updatetemporarypassword.do")
public class UpdateTemporaryPasswordServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateTemporaryPasswordServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		String newPw = request.getParameter("password");
		String id = request.getParameter("id");
		
		int result=new MemberService().updatePassword(id, newPw);
		
		Gson gson = new Gson();
		
		response.setContentType("application/json;charset=utf-8");
		
		gson.toJson(result, response.getWriter());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
