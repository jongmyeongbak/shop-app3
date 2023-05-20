<%@page import="dao.CustomerDao"%>
<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%
	// 고객의 탈퇴여부를 Yes로 변경해서 탈퇴처리 시키세요.
	String id = request.getParameter("id");
	
	new CustomerDao().updateCustomerDisabled("Yes", id);
	
	response.sendRedirect("list.jsp");
%>