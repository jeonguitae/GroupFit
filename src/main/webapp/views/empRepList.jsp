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
<body>
	<jsp:include page="GroupFit_gnb.jsp" />
	<div class="content-wrapper" style="margin-top: 57.08px">
		<section class="content-header">
			<div class="container-fluid">
				<div class="row mb-2">
					<div class="col-sm-6">
						<h1>대표 지점 리스트</h1>
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
					<h6 class="headline">지점을 선택하세요.</h6>
					<form action="empRepList.do" class="search">
						<select name="opt">
							<option value="서초">서초</option>
							<option value="방배">방배</option>
							<option value="역삼">역삼</option>
							<option value="논현">논현</option>
						</select>
						<button>검색</button>
					</form>
				</fieldset>
			<div class="btn1">
				<c:if test="${sessionScope.loginEmp.position eq '대표'}">
					<button onclick="location.href='empJoin.go'">직원 등록</button>
					<button onclick="hide()">직원 삭제</button>
				</c:if>
			</div>
			<div class="table">
				<table>
					<thead>
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
								<td><a href="empDetail.do?detailid=${emp.emp_no}">${emp.name}</a></td>
								<td>${emp.b_name}</td>
								<td>${emp.position}</td>
								<td>${emp.status}</td>
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