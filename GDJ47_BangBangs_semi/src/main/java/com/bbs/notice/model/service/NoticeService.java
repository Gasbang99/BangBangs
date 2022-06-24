package com.bbs.notice.model.service;

import static com.bbs.common.JDBCTemplate.close;
import static com.bbs.common.JDBCTemplate.commit;
import static com.bbs.common.JDBCTemplate.getConnection;
import static com.bbs.common.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.List;

import com.bbs.model.vo.IbBoard;
import com.bbs.notice.model.dao.NoticeDao;
import com.bbs.notice.model.vo.NoticeBoard;
public class NoticeService {
	
	private NoticeDao dao = new NoticeDao();
	
	
	public List<NoticeBoard> selectNoticeList(int cPage,int numPerpage){
		Connection conn = getConnection();
		List<NoticeBoard> result = dao.selectNoticeList(conn,cPage,numPerpage);
		close(conn);
		return result;
		
	}
	public int selectNoticeCount() {
		Connection conn = getConnection();
		int result = dao.selectNoticeCount(conn);
		close(conn);
		return result;
	}
	public int insertNotice(NoticeBoard n) {
		Connection conn=getConnection();
		int result=dao.insertNotice(conn,n);
		if(result>0)commit(conn);
		else rollback(conn);
		close(conn);
		return result;
	}
	public NoticeBoard selectNotice(int noticeNo) {
		Connection conn=getConnection();
		NoticeBoard n = dao.selectNotice(conn,noticeNo);
		close(conn);
		return n;
	}
	public int updateNotice(NoticeBoard n) {
		Connection conn=getConnection();
		int result=dao.updateNotice(conn,n);
		if(result>0)commit(conn);
		else rollback(conn);
		close(conn);
		return result;
	}
	public int deleteNotice(int noticeNo) {
		Connection conn=getConnection();
		int result=dao.deleteNotice(conn,noticeNo);
		if(result>0)commit(conn);
		else rollback(conn);
		close(conn);
		return result;
	}
	public List<NoticeBoard> searchNoticeList(String type,String keyword,int cPage,int numPerpage){
		Connection conn=getConnection();
		List<NoticeBoard> result = dao.searchNoticeList(conn,type,keyword,cPage,numPerpage);
		close(conn);
		return result;
	}
	public int searchNoticeCount(String type,String keyword) {
		Connection conn=getConnection();
		int result=dao.searchNoticeCount(conn,type,keyword);
		close(conn);
		return result;
	}
}
