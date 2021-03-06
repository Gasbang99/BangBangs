package com.bbs.admin.controller;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bbs.admin.service.AdminMemberService;
import com.bbs.model.vo.Member;

/**
 * Servlet implementation class MemberSearchServlet
 */
@WebServlet("/admin/searchMember")
public class MemberSearchServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MemberSearchServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
	  String type=request.getParameter("searchType");
	  String keyword=request.getParameter("searchKeyword");
	  
	  
	  int cPage; 
	  int numPerpage=5; 
	  try {
	  cPage=Integer.parseInt(request.getParameter("cPage"));
	  }catch(NumberFormatException e) { 
		  cPage=1; 
	  }
	  // String
	  //page=request.getParameter("cPage"); // if(page==null) { // cPage=1; // }else
	   // cPage=Integer.parseInt(page); // }
	  
		  Map<String,Object> param=Map.of("type",type,"keyword",keyword,
				  "cPage",cPage,"numPerpage",numPerpage);
				  
	  List<Member> result=new
	  AdminMemberService().searchMemberList(type,keyword,cPage,numPerpage); 
	  int totalData=new AdminMemberService().searchMemberCount(type,keyword); 
	  int totalPage=(int)Math.ceil((double)totalData/numPerpage); int pageBarSize=5;
	  int pageNo=((cPage-1)/pageBarSize)*pageBarSize+1; 
	  int pageEnd=pageNo+pageBarSize-1;
	  
	  String pageBar=""; 
	  if(pageNo==1) { pageBar+="<span>[이전]</span>"; }
	  else {
	  pageBar+="<a href='"+request.getRequestURL()
	  +"?cPage="+(pageNo-1)+"&searchType="+type+"&searchKeyword="+keyword+"'>[이전]</a>"; }
	  
	  while(!(pageNo>pageEnd||pageNo>totalPage)) { if(pageNo==cPage) {
	  pageBar+="<span>"+pageNo+"</span>"; }else {
	  pageBar+="<a href='"+request.getRequestURL()
	  +"?cPage="+(pageNo)+"&searchType="+type+"&searchKeyword="+keyword+"'>"+pageNo
	  +"</a>"; } pageNo++; }
	  
	  if(pageNo>totalPage) { pageBar+="<span>[다음]</span>"; }else {
	  pageBar+="<a href='"+request.getRequestURL()
	  +"?cPage="+(pageNo)+"&searchType="+type+"&searchKeyword="+keyword+
	  "'>[다음]</a>"; } request.setAttribute("pageBar", pageBar);
	  request.setAttribute("list", result);
	  
	  
	  request.getRequestDispatcher(
	  "/views/admin_views/memberManagement/memberList.jsp") .forward(request,
	  response); }
	 

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
