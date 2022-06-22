package com.mypage.controller;

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
 * Servlet implementation class ResignProgressservlet
 */
@WebServlet("/resignprogress.do")
public class ResignProgressservlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ResignProgressservlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		String memberId=request.getParameter("member_id");
		
		int result=new MemberService().deleteMember(memberId);
		
		String msg="",loc="";
		
		loc="/mainscreen.do";
		if(result>0) {
			msg="탈퇴되었습니다";
			HttpSession session=request.getSession(false);
			session.invalidate();
		}else {
			msg="탈퇴를 실패했습니다";			
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
