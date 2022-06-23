package com.bbs.notice.controller;

import java.io.File;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;

import com.bbs.board.model.service.BoardService;
import com.bbs.common.MyFileRenamedPolicy;
import com.bbs.notice.model.vo.NoticeBoard;
import com.oreilly.servlet.MultipartRequest;

/**
 * Servlet implementation class UpdateNoticeEndServlet
 */
@WebServlet("/notice/noticeUpdateEnd.do")
public class UpdateNoticeEndServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateNoticeEndServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		if(!ServletFileUpload.isMultipartContent(request)) {
			 request.setAttribute("msg", "공지사항 작성오류 [form:enctype] 관리자에게 문의하세요! :(");
			 request.setAttribute("loc", "/notice/noticeWrite.do");
			 request.getRequestDispatcher("/views/common/msg.jsp").forward(request, response);
		}else {
			String root=getServletContext().getRealPath("/upload/notice");
			String path=root;
			File f=new File(path);
			if(!f.exists()) f.mkdirs();
			MultipartRequest mr=new MultipartRequest(request,path,(1023*1024*10),"UTF-8",
					new MyFileRenamedPolicy());
		
		NoticeBoard n=NoticeBoard.builder()
				.noticeTitle("noticeTitle")
				.ibPostNum(Integer.parseInt(mr.getParameter("num")))
				.memberId(mr.getParameter("boardWriter"))
				.IbBoardOriginalFilename(mr.getOriginalFileName("upfile"))
				.IbBoardRenamedFilename(mr.getFilesystemName("upfile"))
				.ibContent(mr.getParameter("boardContent"))
				.category(mr.getParameter("boardCategory"))
				.build();
		
		int result=new BoardService().updateMember(b);
		String msg="",loc="";
		
		if(result>0) {
			msg="게시글이 수정되었습니다.";
			loc="/board/boardView.do?no="+b.getIbPostNum();
		}else {
			msg="게시글 수정실패!";
			loc="/board/updateboard.do?num="+b.getIbPostNum();
		}
		request.setAttribute("msg", msg);
		request.setAttribute("loc", loc);
		request.getRequestDispatcher("/views/common/msg.jsp").forward(request, response);
	}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
