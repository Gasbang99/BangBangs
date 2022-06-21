package com.bbs.board.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bbs.board.model.service.BoardService;
import com.bbs.model.vo.IbBoard;

/**
 * Servlet implementation class DeleteBoardServlet
 */
@WebServlet("/board/deleteboard.do")
public class DeleteBoardServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DeleteBoardServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int boardNo=Integer.parseInt(request.getParameter("num"));
		
		int result = new BoardService().deleteBoard(boardNo);
		
		String msg="",loc="";
		if(result>0) {
			msg="게시글이 삭제되었습니다.";
//			loc="/board/boardList.do?no="+boardNo;
			response.sendRedirect(request.getContextPath()+"/board/boardList.do");
		}else {
			msg="게시글 수정실패!";
			loc="/board/boardView.do?no="+boardNo;
			
		}
		request.setAttribute("msg", msg);
		request.setAttribute("loc", loc);
		request.getRequestDispatcher("/views/common/msg.jsp").forward(request, response);
//		request.setAttribute("board", b);
//		request.getRequestDispatcher("/views/board/boardList.jsp").forward(request, response);
		//삭제할때 새로운 화면창넘겨야하니까 sendRedirect로 하고 +로 연결?
		
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
