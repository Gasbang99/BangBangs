package com.mypage.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bbs.board.model.service.IbBoardService;
import com.bbs.model.vo.IbBoard;
import com.bbs.model.vo.RentalHistory;
import com.bbs.rentalreturn.model.service.RentalReturnService;

/**
 * Servlet implementation class HistoryDataServlet
 */
@WebServlet("/historydata.do")
public class HistoryDataServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public HistoryDataServlet() {
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

	
		int	numPerpage=5;
	
		System.out.println(memberId);
		
		List<RentalHistory> rentalHistory=new RentalReturnService().selectRentalHistoryById(memberId, cPage, numPerpage);

		int totalBoard=new RentalReturnService().selectRentalHistoryCountById(memberId);
		int totalPage=(int)Math.ceil((double)totalBoard/numPerpage);

		int pageBarSize=5;
		
		int pageNo=((cPage-1)/pageBarSize)*pageBarSize+1;
		int pageEnd=pageNo+pageBarSize-1;
		
		String pageBar="";
		if(pageNo==1) {
			pageBar+="<li class='page-item disabled'><span class='page-link'>[이전]</span></li>";
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

		request.setAttribute("pageBar", pageBar);
		request.setAttribute("rentalHistory", rentalHistory);
		
		request.getRequestDispatcher("/views/mypage/historyData/mypage_historyData.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
