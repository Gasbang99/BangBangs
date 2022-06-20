package com.bbs.board.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.bbs.board.model.service.BoardService;
import com.bbs.model.vo.IbBoard;

/**
 * Servlet implementation class UpdateBoardServlet
 */
@WebServlet("/board/updateboard.do")
public class UpdateBoardServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateBoardServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		String title = request.getParameter("title");
//		String writer = request.getParameter("writer");
//		String file = request.getParameter("file");
//		String content = request.getParameter("content");
//		
//		IbBoard b = IbBoard.builder()
//				.ibTitle(title)
//				.memberId(writer)
//				.IbBoardOriginalFilename(file)
//				.ibContent(content)
//				.build();
//			
//	int result=new BoardService().updateMember(b);
//		
//		String msg="",loc="";
//		loc="/board/boardView.do?memberId="+b.getMemberId();
//		if(result>0) {
//			msg="정상적으로 정보가 수정되었습니다.";
//		
//			HttpSession session=request.getSession();
//			session.setAttribute("result", b);
//		}else {
//			msg="정보수정을 실패했습니다.다시 시도하세요!";
//			
//		}
//		request.setAttribute("msg", msg);
//		request.setAttribute("loc", loc);
		int boardNo=Integer.parseInt(request.getParameter("num"));
		
		IbBoard b = new BoardService().selectBoard(boardNo);
		
		request.setAttribute("board", b);
		request.getRequestDispatcher("/views/board/updateView.jsp").forward(request, response);
				
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
