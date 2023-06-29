<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>자료실</title>


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
						<h1>자료실</h1>
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
			<button onclick="location.href='referenceWrite.go'">글쓰기</button>
			<button>삭제</button>
				<table class="table table-bordered table-hover dataTable dtr-inline">
			<thead>
				<tr>
			 		<th>no</th>
			 		<th>제목</th>
			 		<th>작성자</th>
			 		<th>작성일자</th>
					<td><input type="checkbox" id="cbx_chkAll"/></td>
				</tr>
			</thead>
			<tbody>
				<c:if test="${list.size() == 0}">
					<tr><th colspan="5">게시글이 없습니다.</th></tr>
				</c:if>
				<c:forEach items="${list}" var="reference">
					<tr>
						<td>${reference.r_idx}</td>
						<td><a href="referenceDetail.do?idx=${reference.r_idx}">${reference.subject}</a></td>
						<td>${reference.emp_no}</td>
						<td>${reference.date}</td>
						<td><input type="checkbox" name="chk"/></td>
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
$(document).ready(function() {
	$("#cbx_chkAll").click(function() {
		if($("#cbx_chkAll").is(":checked")) $("input[name=chk]").prop("checked", true);
		else $("input[name=chk]").prop("checked", false);
	});
	
	$("input[name=chk]").click(function() {
		var total = $("input[name=chk]").length;
		var checked = $("input[name=chk]:checked").length;
		
		if(total != checked) $("#cbx_chkAll").prop("checked", false);
		else $("#cbx_chkAll").prop("checked", true); 
	});
});
</script>
</html>



