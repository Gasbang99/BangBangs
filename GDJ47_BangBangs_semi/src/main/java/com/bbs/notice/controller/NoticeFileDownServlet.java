package com.bbs.notice.controller;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.net.URLEncoder;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class NoticeFileDownServlet
 */
@WebServlet("/file2Download.do")
public class NoticeFileDownServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public NoticeFileDownServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String oriFileName=request.getParameter("oriName");
		String renamedFileName=request.getParameter("reName");
		System.out.println(oriFileName);
		System.out.println(renamedFileName);
		String header=request.getHeader("user-agent");
		boolean isMs=header.contains("Trident")||header.contains("MSIE");
		String encFileName="";
		if(isMs) {
			 encFileName=URLEncoder.encode(oriFileName,"UTF-8");
			 encFileName.replace("\\+", "%20");
		}else {
			encFileName=new String(oriFileName.getBytes("UTF-8"),"ISO-8859-1");
		}
		
		
		response.setContentType("application/octet-stream");
		response.setHeader("Content-Disposition", "attachment;filename="+encFileName);
	
		String path=getServletContext().getRealPath("/upload/notice/");
		FileInputStream fis=new FileInputStream(new File(path+renamedFileName));
		BufferedInputStream bis= new BufferedInputStream(fis);
		
	
		BufferedOutputStream bos = new BufferedOutputStream(response.getOutputStream());
		
		int read=-1;
		while((read=bis.read())!=-1) {
			 bos.write(read);
		}
		bis.close();
		bos.close();
	
	
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
