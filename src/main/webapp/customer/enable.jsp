<%@page import="vo.Customer"%>
<%@page import="dao.CustomerDao"%>
<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%
	// 고객의 탈퇴여부를 No로 변경해서 복구처리 시키세요.
	String id = request.getParameter("id");
	
	CustomerDao customerDao = new CustomerDao();
	Customer customer = customerDao.getCustomerById(id);
	customer.setDisabled("No");
	customerDao.updateCustomer(customer);
	
	response.sendRedirect("list.jsp");
%>