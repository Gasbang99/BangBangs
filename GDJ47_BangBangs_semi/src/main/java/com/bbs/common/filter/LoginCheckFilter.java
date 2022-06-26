package com.bbs.common.filter;

import java.io.IOException;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import com.bbs.common.exception.LoginCheckException;
import com.bbs.model.vo.Member;

/**
 * Servlet Filter implementation class LoginCheckFilter
 */
@WebFilter(urlPatterns = {"/activeTicket.do","/changememberdata.do","/giveTicket.do",
							"/historydata.do","/inquirydata.do","/memberdata.do","/mileage.do",
							"/possessionHistory.do","/purchasedata.do","/refundHistory.do",
							"/resignmember.do","/resignprogress.do","/takeTicket.do",
							"/updatePassEnd.do","/updatePass.do"
							})
public class LoginCheckFilter extends HttpFilter implements Filter {
       
    /**
     * @see HttpFilter#HttpFilter()
     */
    public LoginCheckFilter() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see Filter#destroy()
	 */
	public void destroy() {
		// TODO Auto-generated method stub
	}

	/**
	 * @see Filter#doFilter(ServletRequest, ServletResponse, FilterChain)
	 */
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) 
			throws IOException, ServletException, LoginCheckException {
		// TODO Auto-generated method stub
		// place your code here
		System.out.println("logincheckfilter");
		HttpSession session=((HttpServletRequest)request).getSession(false);
		Member loginMember=(Member)session.getAttribute("loginMember");
		
		if((session!=null&&loginMember==null)
				||!loginMember.getMemberId().equals(request.getParameter("memberId"))) {
			request.setAttribute("msg", "경고! 잘못된 경로로 접근하셨습니다!");
			request.setAttribute("loc", "");
			request.getRequestDispatcher("/views/common/msg.jsp")
			.forward(request, response);
			throw new LoginCheckException("로그인 후 이용하실 수 있습니다");
		}else {
		// pass the request along the filter chain
			chain.doFilter(request, response);
		}
		// pass the request along the filter chain
		chain.doFilter(request, response);
	}

	/**
	 * @see Filter#init(FilterConfig)
	 */
	public void init(FilterConfig fConfig) throws ServletException {
		// TODO Auto-generated method stub
	}

}
