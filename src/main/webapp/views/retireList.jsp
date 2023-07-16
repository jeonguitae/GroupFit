<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>퇴직 직원 리스트</title>
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
	crossorigin="anonymous">
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700&display=fallback">
<link rel="stylesheet" href="plugins/fontawesome-free/css/all.min.css">
<link rel="stylesheet"
	href="plugins/overlayScrollbars/css/OverlayScrollbars.min.css">
<link rel="stylesheet" href="dist/css/adminlte.min.css">
</head>
<style>
div[class="btn1"]{
	margin-left: 1108px;
}

form[class="search"]{
	margin-left: 377px;
}

h1.headline{
	margin-left: 640px;
	margin-top: 20px;
}

div[class="table"]{
	margin-left: 376px;
}
</style>
<body>
	<jsp:include page="GroupFit_gnb.jsp" />
	<div class="content-wrapper" style="margin-top: 57.08px">
		<section class="content-header">
			<div class="container-fluid">
				<div class="row mb-2">
					<div class="col-sm-6">
						<h1>퇴직 직원 리스트</h1>
					</div>
					<div class="col-sm-6">
						<ol class="breadcrumb float-sm-right">
							<li class="breadcrumb-item"><a href="#">메인</a></li>
							<li class="breadcrumb-item active">뎁스1</li>
							<li class="breadcrumb-item active">뎁스2</li>
						</ol>
					</div>
				</div>
			</div>
			<!-- /.container-fluid -->
		</section>
<!-- Main content -->
		<section class="content">
			<div class="container-fluid">
				<fieldset>
					<form action="empRetireList.do" class="search">
						<select name="opt">
							<option value="name">이름</option>
							<option value="b_name">지점</option>
							<option value="position">직급</option>
						</select>
						<input type="text" name="keyword" value="" placeholder="검색어를 입력하세요"/>
						<button>검색</button>
					</form>
				</fieldset>
				
				<div class="btn1">
					<button onclick="location.href='empJoin.go'">직원 등록</button>
					<button onclick="hide()">직원 삭제</button>
					<c:if test="${sessionScope.loginEmp.position eq '대표'}">
						<button onclick="location.href='empRepList.do'">지점별</button>
						<button onclick="location.href='empJoin.go'">퇴사직원</button>
					</c:if>
				</div>
				<div class="table">
					<table>
						<thead>
							<tr>
								<th>사번</th>
								<th>이름</th>
								<th>지점</th>
								<th>직급</th>
								<th>퇴사일</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach items="${list}" var="emp">
								<tr>
									<td>${emp.emp_no}</td>
									<td><a href="empDetail.go?detailid=${emp.emp_no}">${emp.name}</a></td>
									<td>${emp.b_name}</td>
									<td>${emp.position}</td>
									<td>${emp.retire_year}</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
			</div>
<!--/. container-fluid -->
		</section>
	</div>
</body>
</html>