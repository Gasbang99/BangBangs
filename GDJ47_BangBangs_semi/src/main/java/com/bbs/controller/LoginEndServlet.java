package com.bbs.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.bbs.model.service.MemberService;
import com.bbs.model.vo.Member;

/**
 * Servlet implementation class LoginEndServlet
 */
@WebServlet("/loginend.do")
public class LoginEndServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginEndServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		String userId = request.getParameter("id");
		String password = request.getParameter("password");
		
		Member m = new MemberService().searchMember(userId, password);
		
		if(m!=null) {
			// 유지할 수 있는 데이터로 저장
			// HttpSession에 데이터를 저장
			HttpSession session = request.getSession();
			session.setAttribute("loginMember", m);
		}
		
		response.sendRedirect(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
