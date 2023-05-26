<%@page import="dto.Pagination"%>
<%@page import="util.StringUtils"%>
<%@page import="vo.Product"%>
<%@page import="java.util.List"%>
<%@page import="dao.ProductDao"%>
<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%
// 요청 URL - list.jsp
// 요청 URL - list.jsp?page=3
int pageNo = StringUtils.stringToInt(request.getParameter("page"), 1);

ProductDao dao = new ProductDao();
// 전체 데이터 개수 조회하기
int totalRows = dao.getTotalRows();

Pagination pagination = new Pagination(pageNo, totalRows);

// 데이터 조회하기
List<Product> productList = dao.getProducts(pagination.getBegin(), pagination.getEnd());

/* // 한 화면에 표시할 행의 개수
final int ROWS = 10;

// 한 화면에 표시할 쪽번호 개수
int pages = 5;

///////////////////////////////////////////////////////////////////////
// 요청한 쪽에 맞는 데이터 조회하기
///////////////////////////////////////////////////////////////////////
// 요청한 쪽번호에 해당하는 데이터 조회범위를 구하기
int begin = (pageNo - 1) * ROWS + 1;
int end = pageNo * ROWS;

//업무로직 수행 - 전체 상품목록 조회
ProductDao dao = new ProductDao();
List<Product> productList = dao.getProducts(begin, end);

///////////////////////////////////////////////////////////////////////
// 페이지 내비게이션 정보 구하기
///////////////////////////////////////////////////////////////////////

// 전체 데이터 개수 조회하기
int totalRows = dao.getTotalRows();								// 175
// 전체 페이지 개수 구하기
// int totalPages = (int) Math.ceil((double) totalRows / ROWS);	// 175/10 -> 17.5 -> 18
int totalPages = (totalRows - 1) / ROWS + 1;
// 전체 페이지 블록 개수 구하기
// int totalBlocks = (int) Math.ceil((double) totalPages / pages);	// 18/5 -> 3.8 -> 4
int totalBlocks = (totalPages - 1) / pages + 1; 
// 요청한 페이지번호가 속한 블록번호 구하기
int currentBlock = (int) Math.ceil((double) pageNo / pages);	// 1/5 -> 0.2 -> 1
// 페이지 내비게이션의 페이지 구간 구하기
int beginPage = (currentBlock - 1) * pages + 1;
int endPage = currentBlock * pages;
if (currentBlock >= totalBlocks) {
	endPage = totalPages;
} */

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
<jsp:include page="../nav.jsp">
	<jsp:param value="상품" name="menu"/>
</jsp:include>
<div class="container my-3">
	<div class="row mb-3">
		<div class="col-12">
			<h1 class="border bg-light fs-4 p-2">전체 상품 리스트</h1>
		</div>
	</div>
	<div class="row mb-3">
		<div class="col-12">
			<p>전체 상품 목록을 확인하세요.</p>
			<table class="table table-sm">
				<colgroup>
					<col width="10%">
					<col width="30%">
					<col width="20%">
					<col width="20%">
					<col width="20%">
				</colgroup>
				<thead>
					<tr>
						<th>번호</th>
						<th>상품명</th>
						<th>제조사</th>
						<th>가격</th>
						<th>할인가격</th>
					</tr>
				</thead>
				<tbody>
				<%
				for (Product product : productList) {
				%>
					<tr>
						<td><%=product.getNo() %></td>
						<td><a href="detail.jsp?no=<%=product.getNo() %>" class="text-black text-decoration-none"><%=product.getName() %></a></td>
						<td><%=product.getMaker() %></td>
						<td><%=product.getPrice() %> 원</td>
						<td><%=product.getDiscountPrice() %> 원</td>
					</tr>
				<%
				}
				%>
				</tbody>
			</table>
			
			<nav>
				<ul class="pagination justify-content-center">
					<li class="page-item<%=pageNo <= 1 ? " disabled" : ""%>">
						<a href="list.jsp?page=<%=pageNo - 1 %>" class="page-link">이전</a>
					</li>
					<%
					for (int num = pagination.getBeginPage(); num <= pagination.getEndPage(); num++) {
					%>
					<li class="page-item<%=num == pageNo ? " active" : ""%>">
						<a href="list.jsp?page=<%=num %>" class="page-link"><%=num %></a>
					</li>
					<%
					}
					%>
					<li class="page-item<%=pageNo >= pagination.getTotalPages() ? " disabled" : ""%>">
						<a href="list.jsp?page=<%=pageNo + 1 %>" class="page-link">이후</a>
					</li>
				</ul>
			</nav>
			
			<div class="text-end">
				<a href="form.jsp" class="btn btn-primary btn-sm">새 상품 등록</a>
			</div>
		</div>
	</div>
</div>
</body>
</html>