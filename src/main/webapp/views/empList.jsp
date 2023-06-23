<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<style>
	table, th, td{
		border : 1px solid black;
		border-collapse: collapse;
		padding : 5px 10px;
	}
</style>
<body>
<h3>직원 리스트</h3>
<button onclick="location.href='empJoin.go'">직원 등록</button>
<button onclick="location.href='empJoin.go'">직원 삭제</button>
<button onclick="location.href='empJoin.go'">지점별</button>
<button onclick="location.href='empJoin.go'">퇴사직원</button>
<table>
	<thead>
		<tr>
			<th>숨기기</th>
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
				<td>${emp.b_idx}</td>
				<td>${emp.position}</td>
			</tr>
		</c:forEach>
	</tbody>
</table>


</body>
</html>