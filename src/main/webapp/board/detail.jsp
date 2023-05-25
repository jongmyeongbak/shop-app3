<%@page import="dao.CommentDao"%>
<%@page import="vo.Comment"%>
<%@page import="java.util.List"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.HashSet"%>
<%@page import="java.util.Set"%>
<%@page import="util.StringUtils"%>
<%@page import="dao.BoardDao"%>
<%@page import="vo.Board"%>
<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%
int no = StringUtils.stringToInt(request.getParameter("no"));
String loginId = (String) session.getAttribute("loginId"); 

BoardDao boardDao = new BoardDao();
Board board = boardDao.getBoardByNo(no);

if (board == null || "Y".equals(board.getDeleted())) {
	response.sendRedirect("list.jsp?err=deleted");
	return;
}
String err = request.getParameter("err");
%>
<!doctype html>
<html lang="ko">
<head>
<title></title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">
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
			<h1 class="border bg-light fs-4 p-2">게시글 상세 정보</h1>
		</div>
	</div>
	<div class="row mb-3">
		<div class="col-12">
			<p>게시글 상세정보를 확인하세요.</p>
			<table class="table table-bordered">
				<colgroup>
					<col width="10%">
					<col width="40%">
					<col width="10%">
					<col width="40%">
				</colgroup>
				<tbody>
					<tr>
						<th class="table-dark">제목</th>
						<td style='white-space: break-spaces;'><%=board.getTitle() %></td>
						<th class="table-dark">작성자</th>
						<td><%=board.getCustomer().getName() %></td>
					</tr>
					<tr>
						<th class="table-dark">조회수</th>
						<td><%=board.getReadCnt() %></td>
						<th class="table-dark">댓글개수</th>
						<td><%=board.getCommentCnt() %></td>
					</tr>
					<tr>
						<th class="table-dark">등록일</th>
						<td><%=board.getCreateDate() %></td>
						<th class="table-dark">최종수정일자</th>
						<td><%=board.getUpdateDate() %></td>
					</tr>
					<tr>
						<td style='white-space: break-spaces;' colspan="4"><%=board.getContent() %></td>
					</tr>
				</tbody>
			</table>
			<div class="text-end">
				<a href="delete.jsp?no=<%=no %>" class="btn btn-danger btn-sm"<%=loginId == null || !loginId.equals(board.getCustomer().getId()) ? " hidden" : "" %>>삭제</a>
				<a href="modifyform.jsp?no=<%=no %>" class="btn btn-warning btn-sm"<%=loginId == null || !loginId.equals(board.getCustomer().getId()) ? " hidden" : "" %>>수정</a>
				<a href="list.jsp" class="btn btn-primary btn-sm">목록</a>
			</div>
		</div>
	</div>
	<div class="row mb-3">
   		<div class="col-12">
			<form class="border bg-light p-2" method="post" action="insertComment.jsp">
				<input type="hidden" name="boardNo" value="<%=no %>" />
 				<div class="row">
					<div class="col-11">
						<textarea rows="2" class="form-control" name="content" <%="empty".equals(err) ? "placeholder='내용을 입력해야 등록할 수 있습니다.' onfocus='this.placeholder=\"\"'" : "" %>></textarea>
					</div>
					<div class="col-1">
						<button class="btn btn-outline-primary h-100">등록</button>
					</div>
				</div>
			</form>   	
   		</div>
   	</div>
 	<div class="alert alert-danger">
		<strong>삭제 실패</strong> 자신의 댓글만 삭제할 수 있습니다.
	</div>
	<div class="row mb-3">
   		<div class="col-12">
   		<%
   		List<Comment> comments = new CommentDao().getCommentsByBoardNo(no);
   		for (Comment comment : comments) {
   			String cid = comment.getCustomer().getId();
   		%>
   			<div class="border p-2 mb-2">
	   			<div class="d-flex justify-content-between mb-1">
	   				<span><%=comment.getCustomer().getName() %></span> <span class="text-muted"><%=comment.getCreateDate() %></span>
	   			</div>
	   			<div style='white-space: break-spaces;'><%=comment.getContent() %><%
	   			if (cid != null && cid.equals(loginId)) {
	   			%><a href="deleteComment.jsp?no=<%=no %>&cno=<%=comment.getNo() %>" 
	   				class="btn btn-link text-danger text-decoration-none float-end"><i class="bi bi-trash"></i></a>
	   			<%
	   			}
	   			%>
	   			</div>
   			</div>
   		<%
   		}
   		%>
   		</div>
   	</div>
</div>
</body>
</html>