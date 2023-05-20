<%--
	<%@ page 속성명="속성값" %>
		페이지 지시어는 JSP 페이지에 대한 설정정보를 정의한다.
		
		속성			속성값						설명														기본값
		---------------------------------------------------------------------------------------------------------------------------------------
		language		"java"						스크립틀릿에서 사용할 프로그램언어를 정의한다.				"java"
		contentType		"text/html; charset=UTF-8"	이 JSP의 응답컨텐츠 타입과 문자인코딩 방식을 정의한다.		"text/html; charset=ISO-8859-1"
		pageEncoding	"UTF-8"						이 JSP를 파일로 저장할 때 문자인코딩 방식을 정의한다.		"ISO-8859-1"
		trimDirectiveWhitespaces	"true"			지시어 등으로 추가되어 불필요한 공백의 제거여부를 지정한다.	"false"
		isErrorPage		"false"						이 JSP 페이지가 에러페이지로 사용될지 여부를 지정한다.		"false"
													에러를 표시하는 에러페이지가 아닌 경우 기본값을 그대로 사용한다.
		errorPage		"에러페이지경로"			이 JSP 페이지에서 예외가 발생했을 때 이동할 에러페이지를 지정한다.
		---------------------------------------------------------------------------------------------------------------------------------------
	
	<% %>
	스크립틀릿
		이 JSP에서 자바코딩 영역을 설정한다.
 --%>
<%@ page contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>홈</title>
</head>
<body>
	<h1>홈</h1>
<%-- 	<%
	DepartmentDao dao = new DepartmentDao();
	List<Department> depts = dao.getDepartments();
	%>
	<table>
		<thead>
			<tr>
				<th>부서아이디</th>
				<th>부서명</th>
			</tr>
		</thead>
	<tbody>
	<%
	for (Department dept: depts) {
	%>
		<tr>
			<td><%=dept.getId() %></td>
			<td><%=dept.getName() %></td>
		</tr>
	<%
	}
	%>
	</tbody>
	</table> --%>
<%-- <%
	String[] depts = {"영업부", "기술부", "관리부", "총무부"};
%>
	<h3>부서목록</h3>
	<ul>
	<%
	for (String dept : depts) {
	%>
		<li><%=dept %></li>
	<%
	}
	%>
	</ul> --%>
</body>
</html>