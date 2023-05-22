<%@page import="dao.CustomerDao"%>
<%@page import="vo.Customer"%>
<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%
	// 고객의 회원가입 기능을 구현하세요.
	String id = request.getParameter("id");
	String password = request.getParameter("password");
	String name = request.getParameter("name");
	String tel = request.getParameter("tel");
	String email = request.getParameter("email");
	Customer customer = new Customer(id, name, tel, email);
	customer.setPassword(password);
	
	CustomerDao customerDao = new CustomerDao();
	
	if (customerDao.getCustomerById(id) != null) {
		if (customerDao.getCustomerByEmail(email) != null) {
			response.sendRedirect("form.jsp?err=id_email");
			return;
		}
		response.sendRedirect("form.jsp?err=id");
		return;
	}
	if (customerDao.getCustomerByEmail(email) != null) {
		response.sendRedirect("form.jsp?err=email");
		return;
	}
	
	customerDao.insertCustomer(customer);
	
	response.sendRedirect("registered.jsp");
%>