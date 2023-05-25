<%@page import="dao.BoardDao"%>
<%@page import="vo.Comment"%>
<%@page import="dao.CommentDao"%>
<%@page import="java.net.URLEncoder"%>
<%@page import="util.StringUtils"%>
<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%
int cno = StringUtils.stringToInt(request.getParameter("cno"));
int boardNo = StringUtils.stringToInt(request.getParameter("no"));
String loginId = (String) session.getAttribute("loginId");

if (loginId == null) {
	response.sendRedirect("../loginform.jsp?err=req&job=" + URLEncoder.encode("댓글삭제", "utf-8"));
	return;
}

CommentDao commentDao = new CommentDao();
Comment comment = commentDao.getCommentByNo(cno, boardNo);
String customerId = comment.getCustomer().getId();
if (customerId == null || !customerId.equals(loginId)) {
response.sendRedirect("detail.jsp?no=" + boardNo + "&err=id&job=" + URLEncoder.encode("댓글삭제", "utf-8"));
return;
}

commentDao.deleteComment(cno);
new BoardDao().decreaseCommentCnt(boardNo);

response.sendRedirect("detail.jsp?no=" + boardNo);
%>