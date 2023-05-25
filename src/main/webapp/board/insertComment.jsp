<%@page import="dao.BoardDao"%>
<%@page import="java.net.URLEncoder"%>
<%@page import="vo.Board"%>
<%@page import="vo.Customer"%>
<%@page import="vo.Comment"%>
<%@page import="dao.CommentDao"%>
<%@page import="util.StringUtils"%>
<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%
int boardNo = StringUtils.stringToInt(request.getParameter("boardNo"));
String content = request.getParameter("content");
String loginId = (String) session.getAttribute("loginId");

if (loginId == null) {
	response.sendRedirect("../loginform.jsp?err=req&job=" + URLEncoder.encode("댓글등록", "utf-8"));
	return;
}
if (content == null || content.isBlank()) {
	response.sendRedirect("detail.jsp?err=empty&no=" + boardNo);
	return;
}

CommentDao commentDao = new CommentDao();
Comment comment = new Comment();
comment.setContent(content);
comment.setCustomer(new Customer(loginId));
comment.setBoard(new Board(boardNo));

commentDao.insertComment(comment);
new BoardDao().increaseCommentCnt(boardNo);

response.sendRedirect("detail.jsp?no=" + boardNo);
%>