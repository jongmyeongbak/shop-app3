<%@page import="vo.Board"%>
<%@page import="dao.BoardDao"%>
<%@page import="java.net.URLEncoder"%>
<%@page import="util.StringUtils"%>
<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%
String loginId = (String) session.getAttribute("loginId");
if (loginId == null) {
	response.sendRedirect("../loginform.jsp?err=req&job=" + URLEncoder.encode("글삭제", "utf-8"));
	return;
}
int no = StringUtils.stringToInt(request.getParameter("no"));

BoardDao boardDao = new BoardDao();
Board board = boardDao.getBoardByNo(no);
if (!loginId.equals(board.getCustomer().getId())) {
	response.sendRedirect("detail.jsp?no=" + no + "err=id&job=" + URLEncoder.encode("글삭제", "utf-8"));
	return;
}

boardDao.updateDeleted("Y", no);
response.sendRedirect("list.jsp");
%>