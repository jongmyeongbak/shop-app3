<%--
	쇼핑몰의 관리자 기능 구현
		상품관리 product/
			* 상품목록 조회 - list.jsp
			* 상품상세정보 조회 - detail.jsp
			* 신규상품 추가 - form.jsp, insert.jsp
			* 상품정보 변경 - modifyform.jsp, update.jsp 
			* 상품정보 삭제 - delete.jsp
		
		상품목록 조회
			sql.properties
			
			ProductDao.java
			
			product/list.jsp
		
		새 상품 등록하기
			product/form.jsp
				<form />
					method=post
					action=insert.jsp
				입력양식필드에 name 속성을 추가한다.
			
			product/insert.jsp
				form.jsp에서 제출한 상품정보를 데이터베이스에 저장시킨다.
				1. 요청파라미터에서 폼 입력값을 조회한다.
				2. Product객체를 생성하여 조회된 폼입력값을 저장한다.
				3. 업무로직 수행 - 새 상품정보를 테이블에 저장시킨다.
				4. 상품목록을 요청하는 list.jsp를 재요청 URL 응답으로 보낸다
			
			sql.properties
				productDao.insertProdut=insert into web_products\
				(product_no, product_name, product_maker, product_description, product_price, product_discount_price, product_stock) \
				values(web_products_seq.nextval, ?,?,?,?,?,?)
			
			productDao.java
				public void insertProduct(Product product)
		
		
		회원가입 기능
			customer/form.jsp, customer/insert.jsp, customer/registered.jsp
			* customer/form.jsp - 회원가입 폼입니다.
			* customer/insert.jsp - 회원가입 폼에서 입력한 고객정보를 전달받아서 고객정보를 저장시킵니다.
			* customer/registered.jsp - 회원가입 완료 메세지를 출력합니다. 
	                                 - insert.jsp에서 고객정보 저장 후 registered.jsp를 재요청 URL로 지정합니다.
	
		회원목록 정보 조회 기능
			customer/list.jsp
			* customer/list.jsp - 전체 고객목록을 출력합니다.
			* 내비바의 "고객관리"를 클릭하면 list.jsp를 요청합니다.
		
		회원탈퇴처리(disable) 기능
			customer/disable.jsp
			* customer/disable.jsp - 고객정보의 CUST_DIABLED 값을 'Yes'로 변경해서 탈퇴처리 시킵니다. 
						         - 탈퇴처리 후 list.jsp를 재요청하는 URL을 응답으로 보낸다.
		회원복구처리(enable) 기능
			customer/enable.jsp
			* customer/enable.jsp - 고객정보의 CUST_DIABLED 값을 'No'로 변경해서 복구처리 시킵니다. 
						         - 탈퇴처리 후 list.jsp를 재요청하는 URL을 응답으로 보낸다.
	
		회원 상세정보 조회 기능
			customer/detail.jsp
			* customer/detail.jsp - 고객의 상세정보를 출력합니다.
			* list.jsp에서 고객 이름을 클릭하면 detail.jsp를 요청합니다.
	
		회원정보 삭제 기능
			customer/delete.jsp
			* customer/delete.jsp - 고객정보를 삭제한다.
						     - 고객정보 삭제 후 list.jsp를 재요청하는 URL을 응답으로 보낸다.
 --%>
<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<!doctype html>
<html lang="ko">
<head>
<title></title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!--  부트스트랩 CSS와 javascript 라이브러리 -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
<!--  jQuery 라이브러리 -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
</head>
<body>
<nav class="navbar navbar-expand-sm bg-dark navbar-dark">
   <div class="container">
      <ul class="navbar-nav me-auto">
         <li class="nav-item"><a class="nav-link active" href="/app3/home.jsp">홈</a></li>
         <li class="nav-item"><a class="nav-link" href="/app3/product/list.jsp">상품관리</a></li>
         <li class="nav-item"><a class="nav-link" href="/app3/customer/list.jsp">고객 관리</a></li>
         <li class="nav-item"><a class="nav-link disabled" href="">게시판 관리</a></li>
      </ul>
      <ul class="navbar-nav">
         <li class="nav-item"><a class="nav-link disabled" href="">로그인</a></li>
         <li class="nav-item"><a class="nav-link" href="/app3/customer/form.jsp">회원가입</a></li>
      </ul>
   </div>
</nav>
<div class="container">
	<h1>쇼핑몰 관리자 시스템</h1>
</div>
</body>
</html>