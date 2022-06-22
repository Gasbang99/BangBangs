package com.bbs.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.bbs.model.service.MemberService;
import com.bbs.model.vo.Member;

/**
 * Servlet implementation class LoginEndServlet
 */
@WebServlet(name = "loginServlet", urlPatterns = "/loginend.do")
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
		
		// 아이디를 저장하기
		String saveId = request.getParameter("saveId");
		System.out.println(saveId);
		// saveId값을 기준으로 null값이면 아이디를 저장하지 않고
		// on이면 아이디를 저장해서 출력해줘야 함.
		// id값을 유지할 수 있는 저장공간에 저장! -> cookie를 이용하자
		if(saveId!=null) {
			Cookie c = new Cookie("saveId",userId);
			c.setMaxAge(24*60*60*7);
			response.addCookie(c);
		}else {
			Cookie c = new Cookie("saveId","");
			c.setMaxAge(0);
			response.addCookie(c);
		}
		
		Member m = new MemberService().searchMember(userId, password);
		
		System.out.println(password);
		String msg = "", loc = "";
		
		if(m!=null) {
			// 유지할 수 있는 데이터로 저장
			// HttpSession에 데이터를 저장
			HttpSession session = request.getSession();
			session.setAttribute("loginMember", m);
			msg = "환영합니다!";
			loc = "/";
		}else {
			msg = "아이디, 비밀번호를 확인하세요.";
			loc = "/login.do";
		}
		
		request.setAttribute("msg", msg);
		request.setAttribute("loc", loc);
		
		request.getRequestDispatcher("/views/common/msg.jsp").forward(request, response);
		System.out.println(password);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
