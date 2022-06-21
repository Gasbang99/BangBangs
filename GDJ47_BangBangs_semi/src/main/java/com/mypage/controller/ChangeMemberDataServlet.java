package com.mypage.controller;

import java.io.IOException;
import java.sql.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.bbs.model.service.MemberService;
import com.bbs.model.vo.Member;


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
		
		Member m=new Member();
		m.setMemberId(request.getParameter("member_id"));
		m.setMemberName(request.getParameter("member_name"));
		m.setGender(request.getParameter("gender"));
		m.setBirthday(request.getParameter("birthday"));
		m.setEmail(request.getParameter("email"));
		m.setPhone(request.getParameter("phone"));
		m.setAddress(request.getParameter("address"));

		int result=new MemberService().updateMember(m);
		
		String msg="",loc="";
		
		loc="//memberdata.do?userId="+m.getMemberId();
		if(result>0) {
			msg="정상적으로 정보가 수정되었습니다";
			HttpSession session=request.getSession();
			session.setAttribute("loginMember", m);		
		}else {
			msg="정보수정을 실패했습니다.ㅠ 다시 시도하세요!";			
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
