<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항 수정</title>
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
						<h1>공지사항 수정</h1>
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
				<div class="table table-bordered">
		<form action="/nupdate.do" method="post" enctype="multipart/form-data">
		<table>
		<colgroup>
			<col width="20%">
			<col width="80%">
		</colgroup>
			<tr>
				<th>제목</th>
				<td><input type="text" name="title" value="${dto.title}" required/>
					<input type="hidden" name="n_idx" value="${dto.n_idx}">
				</td>
			</tr>
			<tr>
				<th>작성자</th>
				<td>${dto.position}</td>
			</tr>
			<tr>
				<th>작성일시</th>
				<td>${dto.reg_date}</td>
			</tr>
			<tr>
				<th>내용</th>
				<td><textarea class="content" name="content" required>${dto.content}</textarea></td>
			</tr>
			<tr>
				<th>사진 및 파일</th>
				<td>
					<c:forEach items="${photos}" var="photo">
						<img width="500" src="/photo/${photo.new_photo_name}"/>
						<input type="button" onclick="location.href='pdelete.do?new_photo_name=${photo.new_photo_name}&n_idx=${photo.board_num}'" value="삭제"/>
					</c:forEach>
					<input type="file" name="mphotos" multiple="multiple"/>
				</td>
			</tr>
			<tr>
				<th>고정 여부</th>
				<td>
					<input type="radio" name="fix" value="1" required>고정
					<input type="radio" name="fix" value="0" required>고정 안 함
				</td> 
			</tr>			
		</table>
					<input type="button" onclick="location.href='nlist.go'" value="목록"/>
					<button class="forsave">저장</button>
		</form>
		</div>
	
			</div>
			<!--/. container-fluid -->
		</section>
	</div>
</body>
<script>


</script>
</html>