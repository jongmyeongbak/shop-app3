<%@page import="vo.Customer"%>
<%@page import="dao.CustomerDao"%>
<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%
	// 고객의 삭제 기능을 구현하세요.
	String id = request.getParameter("id");
	
	CustomerDao customerDao = new CustomerDao();
	Customer customer = customerDao.getCustomerById(id);
	
	if ("No".equals(customer.getDisabled())) {
		response.sendRedirect("detail.jsp?err=fail&?id=" + id);
		return;
	}
	customerDao.deleteCustomerById(id);
	response.sendRedirect("list.jsp");
%>