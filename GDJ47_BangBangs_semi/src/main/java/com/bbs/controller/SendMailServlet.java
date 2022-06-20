package com.bbs.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bbs.common.sendmail.SendMail;

/**
 * Servlet implementation class SendMailServlet
 */
@WebServlet("/sendmail.do")
public class SendMailServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SendMailServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		String mailAddress = request.getParameter("mailAddress");
		String crtfcNo = "";
		
		if(mailAddress.contains("gmail.")) {
			crtfcNo = SendMail.gmailSend(mailAddress);
		}else if(mailAddress.contains("naver.")) {
			crtfcNo = SendMail.naverMailSend(mailAddress);
		}
		
		request.setAttribute("crtfcNo", crtfcNo);
		
		request.getRequestDispatcher("/views/member/enrollmember.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
