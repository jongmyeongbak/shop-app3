<%@page import="java.util.Iterator"%>
<%@page import="java.util.HashSet"%>
<%@page import="java.util.Set"%>
<%@page import="vo.Board"%>
<%@page import="dao.BoardDao"%>
<%@page import="util.StringUtils"%>
<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%
int no = StringUtils.stringToInt(request.getParameter("no"));

BoardDao boardDao = new BoardDao();
Board board = boardDao.getBoardByNo(no);

if (board == null || "Y".equals(board.getDeleted())) {
	response.sendRedirect("list.jsp?err=deleted");
	return;
}

Set<Integer> viewedPosts = (Set<Integer>) session.getAttribute("viewedPosts");
if (viewedPosts == null) {
	viewedPosts = new HashSet<Integer>();
	session.setAttribute("viewedPosts", viewedPosts);
}

if (!viewedPosts.contains(no)) {
	boardDao.increaseReadCnt(no);
	viewedPosts.add(no);
}

response.sendRedirect("detail.jsp?no=" + no);
%>