<%@ page language="java" contentType="text/html; charset=UTF-8" session="true"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>GroupFit Test</title>

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
	<jsp:include page="GroupFit_gnb.jsp"></jsp:include>
	<!-- Content Wrapper. Contains page content -->
	<div class="content-wrapper" style="margin-top: 57.08px">
		<div class="content-header">
			<div class="container-fluid">
				<div class="row mb-2">
					<div class="col-sm-6">
						<h1 class="m-0">Dashboard v2</h1>
					</div>
					<!-- /.col -->
					<div class="col-sm-6">
						<ol class="breadcrumb float-sm-right">
							<li class="breadcrumb-item"><a href="#">Home</a></li>
							<li class="breadcrumb-item active">Dashboard v2</li>
						</ol>
					</div>
					<!-- /.col -->
				</div>
				<!-- /.row -->
			</div>
			<!-- /.container-fluid -->
		</div>
		<!-- /.content-header -->

		<!-- Main content -->
		<section class="content">
			<div class="container-fluid">
				<div class="nSort">
					<form action="nsorting.do" method="get">
						<table class="first">
							<tr>
								<td colspan="2"><select name="big_hb"
									style="margin-left: 560px;">
										<c:forEach items="${big_hb}" var="b">
											<option value="${b.big_hb}">${b.big_hb}</option>
										</c:forEach>
								</select> <select name="small_hb">
										<option>x</option>
								</select>
									<button class="nbutton">검색</button></td>
							</tr>
						</table>

					</form>
				</div>
				<table class="second">
					<colgroup>
						<col width="10%" />
						<col width="40%" />
						<col width="15%" />
						<col width="25%" />
						<col width="10%" />
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
							<tr>
								<th colspan="5">조건에 해당하는 게시물이 없습니다.</th>
							</tr>
						</c:if>
						<c:forEach items="${list}" var="bbs">
							<c:if test="${not empty sessionScope.loginId}">
								<tr>
									<td style="text-align: center;">${bbs.n_idx}</td>
									<td style="text-align: center;"><a
										href="ndetail.do?=${bbs.n_idx}" id="login">${bbs.title}</a></td>
									<td style="text-align: center;">${bbs.id}</td>
									<td style="text-align: center;">${bbs.fbTime}</td>
									<td style="text-align: center;">${bbs.bhit}</td>
								</tr>
							</c:if>
						</c:forEach>
					</tbody>
				</table>
				<table>
					<tr>
						<td class="nsearch">
							<form action="nsearch.do">
								<input type="text" name="search" value="" /> <select
									name="nsearch">
									<option value="title">제목</option>
									<option value="emp_no">작성자</option>
								</select> <input type="submit" value="검색" />
							</form>
						</td>
					</tr>
				</table>
			</div>
			<!--/. container-fluid -->
		</section>
		<!-- /.content -->
	</div>
</body>
<script type="text/javascript">
var msg = "${msg}";

if(msg != ""){
	alert(msg);
}
</script>
</html>