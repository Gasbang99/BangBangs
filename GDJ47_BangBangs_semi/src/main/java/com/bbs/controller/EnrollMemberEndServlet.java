package com.bbs.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bbs.model.service.MemberService;
import com.bbs.model.vo.Member;

/**
 * Servlet implementation class EnrollMemberEndServlet
 */
@WebServlet(name = "enrollMemberServlet", urlPatterns = "/enrollmemberend.do")
public class EnrollMemberEndServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public EnrollMemberEndServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		String userId = request.getParameter("loginId");
		String password = request.getParameter("password");
		String userName = request.getParameter("name");
		String birthYear = request.getParameter("birthYear");
		String birthMonth = request.getParameter("birthMonth");
		if(birthMonth.length()==1) birthMonth = 0+birthMonth;
		String birthDay = request.getParameter("birthDay");
		String gender = request.getParameter("gender");
		String postcode = request.getParameter("postcode");
		String address = request.getParameter("address");
		String detailAddress = request.getParameter("detailAddress");
		String extraAddress = request.getParameter("extraAddress");
		String email = request.getParameter("email");
		String phone = request.getParameter("cellphoneNo");
		
		Member m = Member.builder()
				.memberId(userId)
				.memberPassword(password)
				.memberName(userName)
				.birthday(birthYear+"/"+birthMonth+"/"+birthDay)
				.gender(gender)
				.address("("+postcode+")"+address+" "+detailAddress+extraAddress)
				.email(email)
				.phone(phone)
				.build();
		
		int result = new MemberService().insertMember(m);
		
		String msg = "", loc = "";
		if(result>0) {
			msg = "회원가입을 축하드립니다! 로그인 해주세요.";
			loc = "/";
		}else {
			msg = "회원가입에 실패했습니다. 다시 시도하세요.";
			loc = "/enrollmember.do";
		}
		request.setAttribute("msg", msg);
		request.setAttribute("loc", loc);
		
		request.getRequestDispatcher("/views/common/msg.jsp").forward(request, response);
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
