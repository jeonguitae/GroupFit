<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>직원 리스트</title>
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
					</div>
				</div>
			</div>
			<!-- /.container-fluid -->
		</section>
<!-- Main content -->
		<section class="content">
			<div class="container-fluid">
		<div class="table">
			<table>
				<thead>
					<tr>
						<th>사번</th>
						<th>이름</th>
						<th>지점</th>
						<th>직급</th>
						<th>재직상태</th>
						<th>선택</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${list}" var="emp">
						<tr>
							<td>${emp.emp_no}</td>
							<td>${emp.name}</td>
							<td>${emp.b_name}</td>
							<td>${emp.position}</td>
							<td>${emp.status}</td>
							<td><input type="button"></td>
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
<script>

</script>
</html>