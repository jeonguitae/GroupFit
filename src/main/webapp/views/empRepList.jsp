<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>대표 지점 리스트</title>
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
	margin-left: 1300px;
	margin-bottom: 10px;
}
form[class="search"]{
	margin-left: 20px;
}
</style>
<body>
	<jsp:include page="GroupFit_gnb.jsp" />
	<div class="content-wrapper" style="margin-top: 57.08px">
		<section class="content-header">
			<div class="container-fluid">
				<div class="row mb-2">
					<div class="col-sm-6">
						<h1>지점 리스트</h1>
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
					<form action="empRepList.do" class="search">
						<select name="opt">
							<option value="서초">서초</option>
							<option value="방배">방배</option>
							<option value="역삼">역삼</option>
							<option value="논현">논현</option>
						</select>
						<button class="btn btn-secondary">검색</button>
					</form>
				</fieldset>
				<div class="btn1">
				<button class="btn btn-secondary" onclick="location.href='empList.go'">목록</button>
				</div>
				<div class="card card-primary">
							<div class="card-header">
								<h4 class="card-title">지점 리스트</h4>
							</div>
							<div class="card-body">
								<table class="table">
									<thead class="table-light">
								<tr>
									<th>삭제</th>
									<th>사번</th>
									<th>이름</th>
									<th>지점</th>
									<th>직급</th>
									<th>재직상태</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach items="${list}" var="emp">
									<tr>
										<td><input type="checkbox" name="chk" value="${emp.emp_no}"/></td>
										<td>${emp.emp_no}</td>
										<td><a href="empDetail.go?detailid=${emp.emp_no}">${emp.name}</a></td>
										<td>${emp.b_name}</td>
										<td>${emp.position}</td>
										<td>${emp.status}</td>
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
<script>
function hide() {
	   var hideList = new Array();
	   $("input[name=chk]:checked").each(function() {
	      hideList.push($(this).val());
	   });
	   $.ajax({
	      type: 'post',
	      url: 'hide.ajax',
	      data: {
	         'hideList' : hideList
	      },
	      dataType: 'text',
	      success: function(data){
	         
	      },
	      error: function(e){
	         console.log(e);
	      }
	   });
	}
</script>
</html>