package com.bbs.board.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bbs.board.model.service.BoardService;
import com.bbs.model.vo.IbBoard;

/**
 * Servlet implementation class BoardListServlet
 */
@WebServlet("/board/boardList.do")
public class BoardListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BoardListServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
				int cPage;
				int numPerpage;
				try {
					cPage=Integer.parseInt(request.getParameter("cPage"));
				}catch(NumberFormatException e) {
					cPage=1;
				}
				try {
					numPerpage=Integer.parseInt(request.getParameter("numPerpage"));
					
				}catch(NumberFormatException e) {
					numPerpage=5;
				}
				List<IbBoard> boards=new BoardService().selectBoardList(cPage,numPerpage);
				int totalBoard=new BoardService().selectBoardCount();
				int totalPage=(int)Math.ceil((double)totalBoard/numPerpage);
				
				int pageBarSize=5;
				int pageNo=((cPage-1)/pageBarSize)*pageBarSize+1;
				int pageEnd=pageNo+pageBarSize-1;
				
				String pageBar="";
				if(pageNo==1) {
					pageBar+="<span></span>";
				}else {
					pageBar+="<a href="+request.getRequestURI()
							 +"?cPage="+(pageNo-1)
							+"&numPerpage="+numPerpage+"></a>";
					
				}
				while(!(pageNo>pageEnd||pageNo>totalPage)) {
					if(cPage==pageNo) {
						pageBar+="<span>"+pageNo+"</span>";
					}else {
						pageBar+="<a href="+request.getRequestURI()
						 +"?cPage="+(pageNo)
						+"&numPerpage="+numPerpage+">"+pageNo+"</a>";
					}
					pageNo++;
				}
				if(pageNo>totalPage) {
					pageBar+="<span></span>";
				}else {
					pageBar+="<a href="+request.getRequestURI()
					 +"?cPage="+(pageNo)
					+"&numPerpage="+numPerpage+"></a>";
				}
				
				request.setAttribute("pageBar", pageBar);
				request.setAttribute("boards", boards);
				request.getRequestDispatcher("/views/board/boardList.jsp").forward(request, response);
				System.out.println(boards);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
