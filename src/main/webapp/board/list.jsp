<%@page import="java.net.URLEncoder"%>
<%@page import="vo.Board"%>
<%@page import="java.util.List"%>
<%@page import="dto.Pagination"%>
<%@page import="dao.BoardDao"%>
<%@page import="util.StringUtils"%>
<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%
String loginId = request.getParameter("loginId");
int pageNo = StringUtils.stringToInt(request.getParameter("pageNo"), 1);

BoardDao boardDao = new BoardDao();
int totalRows = boardDao.getTotalRows();

Pagination pagination = new Pagination(pageNo, totalRows);

List<Board> boardList = boardDao.getBoards(pagination.getBegin(), pagination.getEnd());
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
<style type="text/css">
	.btn.btn-xs {--bs-btn-padding-y: .25rem; --bs-btn-padding-x: .5rem; --bs-btn-font-size: .75rem;}
</style>
</head>
<body>
<jsp:include page="../nav.jsp">
	<jsp:param name="menu" value="게시판"/>
</jsp:include>
<div class="container my-3">
	<div class="row mb-3">
		<div class="col-12">
			<h1 class="border bg-light fs-4 p-2">게시글 목록</h1>
		</div>
	</div>
	<div class="row mb-3">
		<div class="col-12">
			<p>게시글 목록을 확인하세요.</p>
			
			<table class="table table-sm">
				<colgroup>
					<col width="10%">
					<col width="45%">
					<col width="15%">
					<col width="15%">
					<col width="15%">
				</colgroup>
				<thead>
					<tr>
						<th>번호</th>
						<th>제목</th>
						<th>작성자</th>
						<th>리뷰개수</th>
						<th>등록일</th>
					</tr>
				</thead>
				<tbody>
				<%
				for (Board board : boardList) {
					int no = board.getNo();
				%>
					<tr>
						<td><%=no %></td>
						<td><a href="detail.jsp?no=<%=no %>"><%=board.getTitle().replace("\r\n", "<br>") %></a></td>
						<td><%=board.getCustomer().getName() %></td>
						<td><%=board.getCommentCnt() %></td>
						<td><%=board.getCreateDate() %></td>
					</tr>
				<%
				}
				%>
				</tbody>
			</table>
			<nav>
				<ul class="pagination justify-content-center">
					<li class="page-item<%=pageNo <= 1 ? " disabled" : "" %>">
						<a href="list.jsp?page=<%=pageNo - 1 %>" class="page-link">이전</a>
					</li>
					<%
					for (int i = pagination.getBeginPage(); i <= pagination.getEndPage(); i++) {
					%>
					<li class="page-item active">
						<a href="list.jsp?page=<%=i %>" class="page-link"><%=i %></a>
					</li>
					<%
					}
					%>
					<li class="page-item<%=pageNo >= pagination.getTotalPages() ? " disabled" : "" %>">
						<a href="list.jsp?page=<%=pageNo + 1 %>" class="page-link">다음</a>
					</li>
				</ul>
			</nav>
			
			<div class="text-end">
				<a href="<%=loginId == null ? "../loginform.jsp?err=req&job=" + URLEncoder.encode("새글등록", "utf-8") : "form.jsp" %>" class="btn btn-primary btn-sm">새 게시글 등록</a>
			</div>
		</div>
	</div>
</div>
</body>
</html>