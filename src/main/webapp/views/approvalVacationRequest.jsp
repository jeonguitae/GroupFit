<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>여기에 페이지 이름 입력</title>
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
<body>
	<jsp:include page="GroupFit_gnb.jsp" />
	<div class="content-wrapper" style="margin-top: 57.08px">
		<section class="content-header">
			<div class="container-fluid">
				<div class="row mb-2">
					<div class="col-sm-6">
						<h1>새 결재 진행</h1>
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
				<a href="#">휴가신청</a>&nbsp;&nbsp;&nbsp;
				<a href="#">지출결의서</a>&nbsp;&nbsp;&nbsp;
				<a href="#">이벤트결재</a>
				
				<table id="table1">
					<tr>
						<th>기안자</th>
						<td>정택범</td>
					</tr>
					<tr>
						<th>기안일</th>
						<td>2023-06-26</td>
					</tr>
				</table>
				
				<table id="table2" class="table table-bordered table-hover dataTable dtr-inline">
					<tr>
						<th>기간</th>
						<td><input/></td>
					</tr>
					<tr>
						<th>사유</th>
						<td>2023-06-26</td>
					</tr>
					<tr>
						<th>기타사항</th>
						<td>2023-06-26</td>
					</tr>
					<tr>
						<th>첨부파일</th>
						<td>2023-06-26</td>
					</tr>
				</table>
				
				<table id="table3">
					<tr>
						<th>신청</th>
						<th>직원</th>
						<th>지점장</th>
						<th>대표</th>
					</tr>
				</table>
			</div>
			<!--/. container-fluid -->
		</section>
	</div>
</body>
</html>