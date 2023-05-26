<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%
String err = request.getParameter("err");
String job = request.getParameter("job");
%>
<!doctype html>
<html lang="ko">
<head>
<title></title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
</head>
<body>
<jsp:include page="nav.jsp">
	<jsp:param value="로그인" name="menu"/>
</jsp:include>
<div class="container my-3">
	<div class="row mb-3">
		<div class="col-12">
         	<h1 class="border bg-light fs-4 p-2">로그인</h1>
      	</div>
	</div>
	<div class="row mb-3">
		<div class="col-6">
		<%
		if ("fail".equals(err)) {
		%>
			<div class="alert alert-danger">
				<strong>로그인 실패</strong> 아이디 또는 비밀번호가 올바르지 않습니다.
			</div>
		<%
		} else if ("disabled".equals(err)) {
		%>
			<div class="alert alert-danger">
				<strong>로그인 실패</strong> 탈퇴처리된 고객은 로그인할 수 없습니다.
			</div>
		<%
		} else if ("req".equals(err)) {
		%>
			<div class="alert alert-danger">
				<strong>로그인 필요</strong> [<%=job %>]은(는) 로그인 후 사용가능한 서비스입니다.
			</div>
		<%
		}
		%>
			<form class="border bg-light p-3" method="post" action="login.jsp">
				<div class="form-group mb-2">
					<label class="form-label">아이디</label>
					<input type="text" class="form-control" name="id"/>
				</div>
				<div class="form-group mb-2">
					<label class="form-label">비밀번호</label>
					<input type="password" class="form-control" name="password"/>
				</div>
				<div class="text-end">
					<button type="submit" class="btn btn-primary">로그인</button>
				</div>
			</form>
		</div>
	</div>
</div>
</body>
</html>