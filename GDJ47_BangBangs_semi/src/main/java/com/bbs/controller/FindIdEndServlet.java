package com.bbs.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bbs.model.service.MemberService;
import com.bbs.model.vo.Member;
import com.google.gson.Gson;

/**
 * Servlet implementation class FindIdEndServlet
 */
@WebServlet("/findidend.do")
public class FindIdEndServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public FindIdEndServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		String name = request.getParameter("name");
		String mailAddress = request.getParameter("mailAddress");
		
		Member m = new MemberService().findMemberId(name, mailAddress);
		
		System.out.println(m.getMemberId());
		
		Gson gson = new Gson();
		
		response.setContentType("application/json;charset=utf-8");
		
		if(m!=null) gson.toJson(m.getMemberId(), response.getWriter());
		else gson.toJson("no", response.getWriter());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
