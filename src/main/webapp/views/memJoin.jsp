<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700&display=fallback">
<link rel="stylesheet" href="plugins/fontawesome-free/css/all.min.css">
<link rel="stylesheet"
	href="plugins/overlayScrollbars/css/OverlayScrollbars.min.css">
<link rel="stylesheet" href="dist/css/adminlte.min.css">
</head>
<body>
	<jsp:include page="GroupFit_gnb.jsp"></jsp:include>
	<div class="content-wrapper" style="margin-top:57.08px">
	<form action="memjoin.do" method="post">
		<table>
			<tr>
				<th>이름</th>
				<td><input type="text" name="name"/></td>
			</tr>
			<tr>
				<th>생년월일</th>
				<td><input type="password" name="pw"/></td>
			</tr>
			<tr>
				<th>성별</th>
				<td>
					<input type="radio" name="male"/>남자
					&nbsp; &nbsp;
					<input type="radio" name="female"/>여자
				</td>
			</tr>
			<tr>
				<th>연락처</th>
				<td><input type="number" name="phone"/></td>
			</tr>
			<tr>
				<th>이메일</th>
				<td><input type="password" name="pw"/></td>
			</tr>
			
			<tr>
				<th colspan="2">
					<button>다음</button>
					<input type="button" onclick="location.href='memlist.go'">
				</th>
			</tr>
		</table>
	</form>
	</div>
</body>
</html>