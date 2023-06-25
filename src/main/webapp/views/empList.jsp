<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
	table, th, td{
		border : 1px solid black;
		border-collapse: collapse;
		padding : 5px 10px;
	}
</style>
<body>
	<jsp:include page="GroupFit_gnb.jsp"></jsp:include>

	<div class="content-wrapper" style="margin-top: 57.08px">
		<h3>직원 리스트</h3>
		<button onclick="location.href='empJoin.go'">직원 등록</button>
		<button onclick="location.href='empJoin.go'">직원 삭제</button>
		<button onclick="location.href='empJoin.go'">지점별</button>
		<button onclick="location.href='empJoin.go'">퇴사직원</button>
		<table>
			<thead>
				<tr>
					<th>삭제</th>
					<th>사번</th>
					<th>이름</th>
					<th>지점</th>
					<th>직급</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${list}" var="emp">
					<tr>
						<td><input type="checkbox" name="chk" value="'+emp.emp_no+'"/></td>
						<td>${emp.emp_no}</td>
						<td><a href="empDetail.do?detailid=${emp.emp_no}">${emp.name}</a></td>
						<td>${emp.b_name}</td>
						<td>${emp.position}</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
</body>
<script>
var msg = "${msg}";
if(msg != ""){
	alert(msg);
}
</script>
</html>