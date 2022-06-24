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
		
		
		String memId=request.getParameter("member_Id");
		String memName=request.getParameter("member_name");
		String memEmail=request.getParameter("email");
		String postcode = request.getParameter("postcode");
		String address = request.getParameter("address");
		String detailAddress = request.getParameter("detailAddress");
		String extraAddress = request.getParameter("extraAddress");
		String birthYear = request.getParameter("birthYear");
		String birthMonth = request.getParameter("birthMonth");
		if(birthMonth.length()==1) birthMonth = 0+birthMonth;
		String birthDay = request.getParameter("birthDay");
		
		System.out.println("mem="+memId);
		System.out.println("mem="+memName);
		System.out.println("mem="+memEmail);
		Member m=new Member();
		String msg="",loc="";
		int result=0;
		try {
			m.setMemberId(request.getParameter("member_Id"));
			m.setMemberName(request.getParameter("member_name"));
			m.setGender(request.getParameter("gender"));
			m.setBirthday(birthYear+"/"+birthMonth+"/"+birthDay);
			m.setEmail(request.getParameter("email"));
			m.setPhone(request.getParameter("phone"));
			m.setAddress("("+postcode+")"+address+" "+detailAddress+extraAddress);
	
			result=new MemberService().updateMember(m);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
		
		
		loc="//memberdata.do?memberId="+m.getMemberId();
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
