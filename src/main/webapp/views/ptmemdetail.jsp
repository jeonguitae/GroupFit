<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<style>
	div.meminfo. div.memprofile{
		float: center;
	}
</style>
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
						<h1>MY PT 회원 정보</h1>
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
				<div class="ptmeminfo">
					<button class="ptmemupdate" onclick="location.href='ptmemupdate.go'">수정</button>
					<div class="table">
						<table>
							<tr>
								<th>회원번호</th>
								<td>${dto.mem_no}</td>
							</tr>
						
							<tr>
								<th>회원이름</th>
								<td>${dto.name}</td>
							</tr>
							
							<tr>
								<th>성별</th>
								<td>${dto.gender}</td>
							</tr>
							
							<tr>
								<th>생년월일</th>
								<td>${dto.birth}</td>
							</tr>
							
							<tr>
								<th>연락처</th>
								<td>${dto.phone}</td>
							</tr>
							
							<tr>
								<th>목표</th>
								<td>${dto.goal}</td>
							</tr>
							
							<tr>
								<th>특이사항</th>
								<td>${dto.str}</td>
							</tr>
							
							<tr>
								<th>남은 pt횟수</th>
								<td>${dto.count}</td>
							</tr>
						</table> 
	         		</div>
         		</div>
         		
         		<div class="memprofile">
	         		<div class="table">
	         			<c:if test="${dto.new_photo_name eq null}">
		         			<form action="memprofile.do?mem_no=${dto.mem_no}" method="post" enctype="multipart/form-data">
			         			<table>
				         			<tr>
										<th>프로필 사진</th>
										<td>
											<input type="file" name="photo"/>
											<button>전송</button>
										</td>
									</tr>
								</table>
							</form>
						</c:if>
						
						<c:if test="${dto.new_photo_name ne null}">
							<table>
			         			<tr>
									<th>프로필 사진</th>
									<td>
										<img width="100" height="100" src="/photo/${dto.new_photo_name}"/>
									</td>
								</tr>
								</table>
						</c:if>
	         		</div>
         		</div>
			</div>
			<!--/. container-fluid -->
		</section>
	</div>
</body>
</html>