package com.bbs.board.controller;

import java.io.File;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bbs.model.vo.IbBoard;
import com.bbs.board.model.service.BoardService;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

/**
 * Servlet implementation class BoardWriteServlet
 */
@WebServlet("/board/boardWriteEnd.do")
public class BoardWriteEndServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BoardWriteEndServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String root=getServletContext().getRealPath("/upload/");
		String path=root+"/board";
		File f=new File(path);
		if(!f.exists()) f.mkdirs();
		MultipartRequest mr=new MultipartRequest(request,path,(1023*1024*10),"UTF-8",
				new DefaultFileRenamePolicy());
		
		IbBoard b=IbBoard.builder()
				.ibTitle(mr.getParameter("boardTitle"))
				.memberId(mr.getParameter("boardWriter"))
				.IbBoardOriginalFilename(mr.getOriginalFileName("upfile"))
				.IbBoardRenamedFilename(mr.getFilesystemName("upfile"))
				.ibContent(mr.getParameter("boardContent"))
				.category(mr.getParameter("boardCategory"))
				.build();
		
		int result=new BoardService().insertBoard(b);
		String msg="",loc="";
		
		if(result>0) {
			msg="게시글이 등록되었습니다.";
			loc="/board/boardList.do";
		}else {
			msg="게시글 등록실패!";
			loc="/board/boardWrite.do";
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
