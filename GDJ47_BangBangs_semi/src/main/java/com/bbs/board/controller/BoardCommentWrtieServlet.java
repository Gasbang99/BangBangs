package com.bbs.board.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bbs.board.model.service.BoardService;
import com.bbs.model.vo.IbBoardComment;

/**
 * Servlet implementation class BoardCommentWrtieServlet
 */
@WebServlet("/board/insertBoardComment.do")
public class BoardCommentWrtieServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BoardCommentWrtieServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String content=request.getParameter("content");
		String writer=request.getParameter("writer");
		int pNum=Integer.parseInt(request.getParameter("pNum"));
		
		IbBoardComment ibc=IbBoardComment.builder()
				.IbCommentContent(content)
				.IbCommentWriter(writer)
				.IbPostNum(pNum)
				.build();
		
		int result=new BoardService().insertBoardComment(ibc);
		String msg=result>0?"댓글등록성공":"댓글등록실패";
		request.setAttribute("msg", msg);
		request.setAttribute("loc","/board/boardView.do?no="+pNum);
		
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
