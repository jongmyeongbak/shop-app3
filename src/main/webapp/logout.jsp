<%@page import="java.util.HashSet"%>
<%@page import="java.util.Set"%>
<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%
// 리퀘스트속성을 저장한다.
Set<Integer> viewedPosts = (Set<Integer>) request.getAttribute("viewedPosts");
// 리퀘스트속성이 유효하다는 것은 logout.jsp에서 세션이 폐기된 뒤 속성정보가 리퀘스트에 실려 포워딩되었다는 뜻이다.
if (viewedPosts != null) {
	session.setAttribute("viewedPosts", viewedPosts);
	// home.jsp를 재요청하는 URL을 응답으로 보낸다.
	response.sendRedirect("home.jsp");
	return;
}

// 기존 세션속성을 저장한다.
viewedPosts = (Set<Integer>) session.getAttribute("viewedPosts");

// 해당 클라이언트의 HttpSession객체를 무효화(폐기)한다.
session.invalidate();

// 글을 조회한 적이 없으면 바로 리다이렉트한다.
if (viewedPosts == null) {
	response.sendRedirect("home.jsp");
	return;
}
// 저장된 속성을 전달하기 위해 리퀘스트에 부여한다.
request.setAttribute("viewedPosts", viewedPosts);

// 리디렉션할 때는 리퀘스트를 전달할 수 없으므로 일단 자기자신에게 포워드한다.
request.getRequestDispatcher("logout.jsp").forward(request, response);
%>