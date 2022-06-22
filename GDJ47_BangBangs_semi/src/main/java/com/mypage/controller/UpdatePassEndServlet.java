package com.mypage.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bbs.model.service.MemberService;
import com.bbs.model.vo.Member;

/**
 * Servlet implementation class UpdatePassEndServlet
 */
@WebServlet("/updatePassEnd.do")
public class UpdatePassEndServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdatePassEndServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String memberId=request.getParameter("memberId");
		String oriPw=request.getParameter("password");
		String newPw=request.getParameter("password_new");
		//현재비밀번호가 맞는지 확인
		Member m=new MemberService().searchMember(memberId, oriPw);
		String msg="",loc="";
		if(m!=null) {
			//현재 비밀번호가 맞음
			//새 비밀번호로 변경
			int result=new MemberService().updatePassword(memberId, newPw);
			if(result>0) {
				msg="비밀번호 변경을 완료했습니다";
				//메세지 출력후 새창 닫기
				String script="opener.location.replace('"+request.getContextPath()+"/logout.do');close()";
				request.setAttribute("script", script);
			} else {
				msg="비밀번호 변경을 실패했습니다";
				loc="/member/updatePassword.do?memberId"+memberId;
			}
			//메세지 출력 후 새창닫기
			
		}else {
			//현재 비밀번호가 틀림
			//경고메세지 출력 후  패스워드 변경페이지로 이동
			msg="현재비밀번호 가 맞지 않습니다";
			loc="/updatePass.do?memberId"+memberId;
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
