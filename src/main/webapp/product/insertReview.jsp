<%@page import="dao.ReviewDao"%>
<%@page import="vo.Customer"%>
<%@page import="vo.Product"%>
<%@page import="vo.Review"%>
<%@page import="java.net.URLEncoder"%>
<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%
// 요청 파라미터값 조회
int productNo = Integer.parseInt(request.getParameter("productNo"));
String content = request.getParameter("content");

// 세션에 속성으로 저장된 로그인아이디 조회하기
String loginId = (String) session.getAttribute("loginId");
if (loginId == null) {
	response.sendRedirect("../loginform.jsp?err=req&job=" + URLEncoder.encode("리뷰작성", "utf-8"));
	return;
}

// Reviews객체를 생성하여 요청파라미터 및 고객정보 저장하기
Review review = new Review();
review.setContent(content);
review.setProduct(new Product(productNo));
review.setCustomer(new Customer(loginId));

// Review객체에 저장된 리뷰정보를 테이블에 저장한다.
new ReviewDao().insertReview(review);

// detail.jsp를 재요청하는 URL을 응답으로 보낸다.
response.sendRedirect("detail.jsp?no=" + productNo);
%>