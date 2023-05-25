<%@page import="java.util.HashSet"%>
<%@page import="java.util.Set"%>
<%@page import="dao.BoardDao"%>
<%@page import="vo.Customer"%>
<%@page import="vo.Board"%>
<%@page import="java.net.URLEncoder"%>
<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%
String loginId = (String) session.getAttribute("loginId");
if (loginId == null) {
	response.sendRedirect("../loginform.jsp?err=req&job=" + URLEncoder.encode("새글등록", "utf-8"));
	return;
}

String title = request.getParameter("title");
String content = request.getParameter("content");
if (title == null || content == null) {
	response.sendRedirect("form.jsp?err=empty");
	return;
}

Board board = new Board();
BoardDao boardDao = new BoardDao();
int no = boardDao.getBoardsSeq();
board.setNo(no);
board.setTitle(title);
board.setContent(content);
board.setCustomer(new Customer(loginId));
boardDao.insertBoard(board);

// 게시물 작성 시 조회수증가제외대상 처리
// Set<Integer> viewedPosts = (Set<Integer>) session.getAttribute("viewedPosts");
// if (viewedPosts == null) {
//	viewedPosts = new HashSet<Integer>();
// }
// viewedPosts.add(no);
// session.setAttribute("viewedPosts", viewedPosts);

// 조회수가 증가되지 않도록 세부정보로 바로 리디렉션
response.sendRedirect("detail.jsp?no=" + no);
%>