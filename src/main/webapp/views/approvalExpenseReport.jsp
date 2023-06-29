<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>지출결의서</title>	
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<style>
	
	#aAp{
		margin-left: 70px;
		margin-top: 20px;
	}

	#table1{
		border: 1px solid black;
		border-collapse: collapse;
		padding: 10px 10px;
		margin-left: 70px;
   		margin-top: 30px;
	}
	#table1 th{
		border: 1px solid black;
		border-collapse: collapse;
		padding: 15px 10px;
	}
	#table1 td{
		border: 1px solid black;
		border-collapse: collapse;
		padding: 5px 10px;
	}
	
	#table3{
		border: 1px solid black;
		border-collapse: collapse;
		padding: 5px 10px;
		text-align: center;
		width: 350px;
		float: right;
		margin-right: 90px;
	}
	
	#table3 th {
	    border: 1px solid black;
	    border-collapse: collapse;
	    padding: 5px;
	    text-align: center;
	}
	
	#table3 td {
	    border: 1px solid black;
	    border-collapse: collapse;
	    padding: 5px 10px;
	    width: 100px;
	    text-align: center;
	}
	
	#table3_1{
		border: 1px solid black;
		border-collapse: collapse;
		padding: 5px 10px;
		text-align: center;
		width: 20%;
		float: right;
		margin-right: 10%;
	}
	
	#table3_1 th {
	    border: 1px solid black;
	    border-collapse: collapse;
	    padding: 5px;
	    text-align: center;
	}
	
	#table3_1 td {
	    border: 1px solid black;
	    border-collapse: collapse;
	    padding: 5px 10px;
	    width: 100px;
	    text-align: center;
	}
	
	#tr2{
		height: 100px;
		vertical-align: bottom;
	}
	#tr1{
		vertical-align: middle;
	}
	
	#table2{
		border: 1px solid black;
	    border-collapse: collapse;
	    padding: 10px 10px;
	    margin-left: 6%;
    	margin-top: 20%;
	}
	
	#table2 th{
		border: 1px solid black;
	    border-collapse: collapse;
	    padding: 5px 10px;
	    width: 270px;
	    align-content: center;
	}
	
	#table2 td{
		border: 1px solid black;
	    border-collapse: collapse;
	    padding: 10px 10px;
	    width: 825px;
	}

	#button_sin_mok {
    text-align: center;
    margin-top:30px;
}

	.content-header {
	    margin-bottom: 30px;
}

	textarea {
   		width: 600px;
   		height: 30px;
}
	
</style>
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
						<h1>새 결재 진행</h1>
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
				<h5 id="aAp" style="display: inline;"><a href="approvalVacationRequest.go">휴가신청</a></h5>
				<h5 id="aAp" style="display: inline;"><a href="approvalExpenseReport.go">지출결의서</a></h5>
				<h5 id="aAp" style="display: inline;"><a href="approvalEventRequest.go">이벤트결재</a></h5>
				
				<div style="overflow: hidden;">
					<table id="table1" style="float: left;">
						<tr>
							<th>기안자</th>
							<td>
								${loginIdName}
								<input type="hidden" name="emp_no" value="${loginId}" readonly="readonly"/>
							</td>
						</tr>
						<tr>
							<th>기안일</th>
							<td><span id="currentDate"></span></td>
						</tr>
					</table>
					
				<c:if test="${position eq 'FC' or position eq '트레이너'}">
					<table id="table3">
						<tr id="tr1">
							<th rowspan="4">신청</th>
							<th>직원</th>
							<th rowspan="4">결재</th>
							<th>지점장</th>
							<th>대표</th>
						</tr>
						<tr id="tr2">
							<td>${loginIdName}</td>
							<td>${manager}</td>
							<td>${top_Manager }</td>
						</tr>
					</table>
					</c:if>	
					
					<c:if test="${position eq '지점장'}">
					<table id="table3_1">
						<tr id="tr1">
							<th rowspan="3">신청</th>
							<th>지점장</th>
							<th rowspan="3">결재</th>
							<th>대표</th>
						</tr>
						<tr id="tr2">
							<td>${loginIdName}</td>
							<td>${top_Manager }</td>
						</tr>
					</table>
					</c:if>	
				
				
				<table id="table2">
					<tr>
						<th>기간</th>
						<td><input type="date" name="start_day"/>&nbsp;&nbsp;~&nbsp;&nbsp;<input type="date" name="finish_day"/></td>
					</tr>
					<tr>
						<th>사유</th>
						<td><textarea name="reason"></textarea></td>
					</tr>
					<tr>
						<th>기타사항</th>
						<td><textarea name="etc"></textarea></td>
					</tr>
					<tr>
						<th>첨부파일</th>
						<td><input type="file" name="files" multiple="multiple"/></td>
					</tr>
				</table>
				<div id="button_sin_mok">
					<button id="sin">신청하기</button>
					<button id="mok" onclick="location.href='approvalList.do'">목록</button>
				</div>
			</div>
		</div>	
			<!--/. container-fluid -->
		</section>
	</div>
</body>
<script type="text/javascript">
	var currentTime = new Date();
	var year = currentTime.getFullYear();
	var month = currentTime.getMonth() + 1;
	var day = currentTime.getDate();
	
	var currentDate = year + "." + month + "." + day;
	
	document.getElementById("currentDate").innerText = currentDate;
	</script>
</html>