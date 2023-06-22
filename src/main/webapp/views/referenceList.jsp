<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
<meta charset="UTF-8">
<title>자료실</title>
<script src="https://code.jquery.com/jquery-3.6.3.min.js"></script>
<style>
	table, th, td{
		border : 1px solid black;
		border-collapse: collapse;
		padding : 5px 10px;
	}
	#login{
		margin-bottom: 20px;
	}
	
	li{
		list-style-type: none;
	}
	input[type='text']{
		width: 75px;
	}
	
</style>
</head>
<body>

	<h1>자료실</h1>

		<form action="list.do">
			<select name="opt">
				<option value="name">제목</option>
				<option value="email">작성자</option>
			</select>
			<input type="text" name="keyword" value="" placeholder="검색어를 입력하세요"/>
			<button>검색</button>
		</form>
		<button class="write" name="write">글작성</button>
		<button class="delete" name="delete">삭제</button>

	<table>
		<thead>
			<tr>
		 		<th>no</th>
		 		<th>제목</th>
		 		<th>작성자</th>
		 		<th>작성일자</th>
				<td><input type="checkbox"/></td>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${list}" var="reference">
				<tr>
					<td>${reference.r_idx}</td>
					<td><a href="detail.do?id=${reference.r_idx}">${reference.subject}</a></td>
					<td>${reference.emp_no}</td>
					<td>${reference.date}</td>
					<td><input type="checkbox"/></td>
				</tr>			
			</c:forEach>
		</tbody>
	</table>
</body>
<script>
</script>
</html>