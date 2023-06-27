<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<style>

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
<!-- Main content -->
		<section class="content">
			<div class="container-fluid">
				<div class="table">
					<table>
						<tr>
							<th>회원번호</th>
							<td>${dto.mem_no}</td>
						</tr>
						
						<tr>
							<th>판매자</th>
							<td>${dto.emp_name}</td>
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
							<th>등록지점</th>
							<td>${dto.b_name}</td>
						</tr>
						
						<tr>
							<th>등록기간</th>
							<td>${dto.start_date} ~ ${dto.end_date}</td>
						</tr>
					</table> 
         		</div>
         		
         		<div class="table">
         			<c:if test="${pdto.new_photo_name eq null}">
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
					
					<c:if test="${pdto.new_photo_name ne null}">
						<table>
		         			<tr>
								<th>프로필 사진</th>
								<td>
									<img width="500" src="/photo/${pdto.new_photo_name}"/>
								</td>
							</tr>
							</table>
					</c:if>
         		</div>
			</div>
			<!--/. container-fluid -->
		</section>
	</div>
</body>
</html>