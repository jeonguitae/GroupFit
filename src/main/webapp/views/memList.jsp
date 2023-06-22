<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
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
		<table class="second">
		<colgroup>
			<col width="10%"/>
			<col width="40%"/>
			<col width="15%"/>
			<col width="25%"/>
			<col width="10%"/>
		</colgroup>
		<thead>
			<tr>
				<th>번호</th>
				<th>제목</th>
				<th>작성자</th>
				<th>작성일</th>
				<th>조회수</th>
			</tr>
		</thead>		
		<tbody>
			<c:if test="${list eq null}">
				<tr>
					<th colspan="6">등록된 글이 없습니다.</th>
				</tr>
			</c:if>
			<c:if test="${list.size() == 0}">
               <tr><th colspan="5">조건에 해당하는 게시물이 없습니다.</th></tr>
            </c:if>
			<c:forEach items="${list}" var="bbs">
				<c:if test="${not empty sessionScope.loginId}">
					<tr>
						<td style="text-align: center;">${bbs.mem_no}</td>
						<td style="text-align: center;"><a href="memDetail.do?mem_no=${bbs.mem_no}">${bbs.name}</a></td>
						<td style="text-align: center;">${bbs.start_date} ~ ${bbs.end_date}</td>
					</tr>
				</c:if>
			</c:forEach>
		</tbody>
	</table> 
	</div>
</body>
</html>