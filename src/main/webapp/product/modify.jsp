<%@page import="dao.ProductDao"%>
<%@page import="vo.Product"%>
<%@page import="vo.Category"%>
<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%
int no = Integer.parseInt(request.getParameter("no"));
String name = request.getParameter("name");
String maker = request.getParameter("maker");
int price = Integer.parseInt(request.getParameter("price"));
int discountPrice = Integer.parseInt(request.getParameter("discountPrice"));
String description = request.getParameter("description");
int catNo = Integer.parseInt(request.getParameter("catNo"));
Category category = new Category(catNo);

ProductDao productDao = new ProductDao();
Product product = productDao.getProductByNo(no);

product.setName(name);
product.setMaker(maker);
product.setPrice(price);
product.setDiscountPrice(discountPrice);
product.setDescription(description);
product.setCategory(category);
productDao.updateProduct(product);

response.sendRedirect("detail.jsp?no=" + no);
%>