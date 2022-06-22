package com.bbs.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bbs.common.sendmail.SendMail;
import com.google.gson.Gson;

/**
 * Servlet implementation class SendTemporaryPasswordServlet
 */
@WebServlet("/sendTemporaryPassword.do")
public class SendTemporaryPasswordServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SendTemporaryPasswordServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		String mailAddress = request.getParameter("mailAddress");
		String id = request.getParameter("id");
		
		String temPw = SendMail.sendTemporaryPassword(mailAddress, id);
		
		Gson gson = new Gson();
		
		response.setContentType("application/json;charset=utf-8");
		
		gson.toJson(temPw, response.getWriter());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
