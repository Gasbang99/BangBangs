package com.mypage.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bbs.board.model.service.IbBoardService;
import com.bbs.model.service.MemberService;
import com.bbs.model.vo.IbBoard;
import com.bbs.model.vo.Member;

/**
 * Servlet implementation class InquiryDataServlet
 */
@WebServlet("/inquirydata.do")
public class InquiryDataServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public InquiryDataServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String userId=request.getParameter("userId");
		
		int cPage;
		int numPerpage;
		try {
			cPage=Integer.parseInt(request.getParameter("cPage"));
		}catch(NumberFormatException e) {
			cPage=1;
		}
		try {
			numPerpage=Integer.parseInt(request.getParameter("numPerPage"));
		}catch(NumberFormatException e) {
			numPerpage=5;
		}
		List<IbBoard> boards=new IbBoardService().selectIbBoardListById(userId, cPage, numPerpage);
		int totalBoard=new IbBoardService().selectIbBoardCountById(userId);
		int totalPage=(int)Math.ceil((double)totalBoard/numPerpage);
		
		int pageBarSize=5;
		int pageNo=((cPage-1)/pageBarSize)*pageBarSize+1;
		int pageEnd=pageNo+pageBarSize-1;
		
		String pageBar="";
		if(pageNo==1) {
			pageBar+="<span>[이전]</span>";
		}else {
			pageBar+="<a href="+request.getRequestURL()
					+"?cPage="+(pageNo-1)
					+"&numPerpage="+numPerpage+">[이전]</a>";
		}
		
		while(!(pageNo>pageEnd||pageNo>totalPage)) {
			if(cPage==pageNo) {
				pageBar+="<span>"+pageNo+"</span>";
			}else {
				pageBar+="<a href="+request.getRequestURL()
				+"?cPage="+(pageNo)
				+"&numPerpage="+numPerpage+">"+pageNo+"</a>";
			}
			pageNo++;
		}
		
		if(pageNo>totalPage) {
			pageBar+="<span>[다음]</span>";
		}else {
			pageBar+="<a href="+request.getRequestURL()
			+"?cPage="+(pageNo)
			+"&numPerpage="+numPerpage+">[다음]</a>";
		}
		
		request.setAttribute("pageBar", pageBar);
		request.setAttribute("boards", boards);
		
		
		request.getRequestDispatcher("/views/mypage/memberData/inquirydata.jsp").forward(request, response);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
