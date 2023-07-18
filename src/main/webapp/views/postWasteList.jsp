<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>휴지통</title>
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
						<h1>보낸 쪽지 휴지통</h1>
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
				<div class="card card-primary">
						<div class="card-header">
							<h4 class="card-title">보낸 쪽지 휴지통</h4>
						</div>
						<div class="card-body">
							<table class="table">
								<thead class="table-light">
								<tr>
									<th>제목</th>
									<th>받은사람</th>
									<th>보낸시간</th>
									<th>읽은시간</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach items="${list}" var="post">
									<tr>
										<td><a href="postSendDetail.do?emailid=${post.email_num}">${post.subject}</a></td>
										<td>${post.name}</td>
										<td>${post.send_time}</td>
										<c:if test="${post.get_chk eq '1'}">
										<td>${post.chk_time}</td>
										</c:if>
										<c:if test="${post.get_chk ne '1'}">
										<td>안읽음</td>
										</c:if>
									</tr>
								</c:forEach>
							</tbody>
						</table>
					</div>
				</div>
			</div>
			<!--/. container-fluid -->
		</section>
	</div>
</body>
</html>