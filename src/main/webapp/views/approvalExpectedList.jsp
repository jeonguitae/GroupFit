<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>결재 예정 문서함</title>


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
						<h1>결재 예정 문서함</h1>
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
				<table class="table table-bordered table-hover dataTable dtr-inline">
			<thead>
				<tr>
			 		<th>no</th>
			 		<th>결재구분</th>
			 		<th>제목</th>
			 		<th>신청자</th>
			 		<th>기안일</th>
					<td>처리상태</td>
				</tr>
			</thead>
			<tbody>
				<c:if test="${list.size() == 0}">
					<tr><th colspan="6">결재신청이 없습니다.</th></tr>
				</c:if>
				<c:forEach items="${list}" var="expected">
					<tr>
						<td>${expected.a_idx}</td>
						<td>${expected.approval}</td>
						<td><a href="eventDetail.do?a_idx=${expected.a_idx}&approval=${expected.approval}">${expected.subject}</a></td>
						<td>${expected.name }</td>
						<td>${expected.write_date}</td>
						<td>${expected.state}</td>
					</tr>			
				</c:forEach>
			</tbody>
		</table>
			</div>
			<!--/. container-fluid -->
		</section>
	</div>
</body>
<script type="text/javascript">


</script>
</html>



