package com.mypage.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


/**
 * Servlet implementation class ChangeMemberDataServlet
 */
@WebServlet("/changememberdata.do")
public class ChangeMemberDataServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ChangeMemberDataServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
//		String userId=request.getParameter("userId");
//		Member m= new MemberService().selectMemberById(userId);
//		try {
//			String email=m.getEmail();
//			email=AESEncrypt.decrypt(email);
//			m.setEmail(email);
//			m.setPhone(AESEncrypt.decrypt(m.getPhone()));
//			m.setAddress(AESEncrypt.decrypt(m.getAddress()));
//		} catch (Exception e) {
//			e.printStackTrace();
//		}
//		request.setAttribute("member", m);
		
		
		request.getRequestDispatcher("/views/mypage/memberData/changeMemberData.jsp")
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
