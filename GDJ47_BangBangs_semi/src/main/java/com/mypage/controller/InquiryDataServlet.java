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
		String memberId=request.getParameter("memberId");
		
		int cPage;
		
		try {
			cPage=Integer.parseInt(request.getParameter("cPage"));
		}catch(NumberFormatException e) {
			cPage=1;
		}
		System.out.println(cPage);
	
		int	numPerpage=5;
	
		System.out.println(numPerpage);
		System.out.println(memberId);
		List<IbBoard> ibBoards=new IbBoardService().selectIbBoardListById(memberId, cPage, numPerpage);
		System.out.println(ibBoards);
		int totalBoard=new IbBoardService().selectIbBoardCountById(memberId);
		int totalPage=(int)Math.ceil((double)totalBoard/numPerpage);
		System.out.println(totalBoard);
		int pageBarSize=5;
		
		int pageNo=((cPage-1)/pageBarSize)*pageBarSize+1;
		int pageEnd=pageNo+pageBarSize-1;
		
		String pageBar="";
		if(pageNo==1) {
			pageBar+="<li class='page-item disabled'><span>[이전]</span></li>";
		}else {
			pageBar+="<li class='page-item'><a class='page-link' href="+request.getRequestURL()
					+"?cPage="+(pageNo-1)
					+"&numPerpage="+numPerpage+"&memberId="+memberId+">[이전]</a></li>";
		}
		
		while(!(pageNo>pageEnd||pageNo>totalPage)) {
			if(cPage==pageNo) {
				pageBar+="<li class='page-item active'><span class='page-link'>"+pageNo+"</span></li>";
	
			} else {
				pageBar+="<li class='page-item'><a class='page-link' href="+request.getRequestURL()
				+"?cPage="+(pageNo)
				+"&numPerpage="+numPerpage+"&memberId="+memberId+">"+pageNo+"</a></li>";
			}
			pageNo++;
		}
		
		if(pageNo>totalPage) {
			pageBar+="<li class='page-item'><span class='page-link disable'>[다음]</span></li>";
		}else {
			pageBar+="<a class='page-link' href="+request.getRequestURL()
			+"?cPage="+(pageNo)
			+"&numPerpage="+numPerpage+"&memberId="+memberId+">[다음]</a></li>";
		}
		System.out.println(pageBar);
		request.setAttribute("pageBar", pageBar);
		request.setAttribute("ibBoards", ibBoards);
		
		
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
