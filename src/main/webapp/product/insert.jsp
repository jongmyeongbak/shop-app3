<%@page import="dao.ProductDao"%>
<%@page import="vo.Product"%>
<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%
	// 요청매개변수값 조회
	String name = request.getParameter("name");
	String maker = request.getParameter("maker");
	int amount = Integer.parseInt(request.getParameter("amount"));
	int price = Integer.parseInt(request.getParameter("price"));
	String description = request.getParameter("description");
	
	Product product = new Product();
	product.setName(name);
	product.setMaker(maker);
	product.setStock(amount);
	product.setPrice(price);
	product.setDiscountPrice((int) (product.getPrice() * 0.9));
	product.setDescription(description);
	
	// 업무로직 수행 - 새 상품정보를 저장시킨다.
	new ProductDao().insertProduct(product);
	
	// 재요청URL 응답 - list.jsp
	response.sendRedirect("list.jsp");
	
%>