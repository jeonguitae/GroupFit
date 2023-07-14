<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>이벤트신청</title>	
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<style>

	#aAp{
		margin-left: 70px;
		margin-top: 20px;
		display: inline;
	}	

	#table1 {
		border: 1px solid black;
	    border-collapse: collapse;
	    float: left;
	    margin-top: 4%;
	    margin-left: 5%;
	    position: absolute;
	}
	#table1 th{
		border: 1px solid black;
	    padding: 10px;
		
	}
	#table1 td{
		border: 1px solid black;
	    padding: 10px;
	}
	
	
	
	#table2{
		border: 1px solid black;
	    border-collapse: collapse;
	    margin-top: 15%;
	    margin-left: 5%;
	    position: absolute;
	    width: 70%;
	}
	#table2 th{
		border: 1px solid black;
		padding: 10px;
	}
	#table2 td{
		border: 1px solid black;
		padding: 10px;
	}
	
	
	
	#table3{
		border: 1px solid black;
	    border-collapse: collapse;
	    padding: 5px 10px;
	    text-align: center;
	    width: 30%;
	    float: right;
	    margin-right: 9%;
	    margin-top: 5%;
	    margin-bottom: 4%;
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
	    float: right;
	    margin-right: 9%;
	    margin-top: 2%;
	    text-align: center;
	    width: 20%;
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
	    text-align: center;
	    width: 40%;
	}
	
	#tr22{
		height: 100px;
		vertical-align: bottom;
	}
	
	#tr11{
		vertical-align: middle;
	}
	
	#tr2{
		height: 100px;
		vertical-align: bottom;
	}
	#tr1{
		vertical-align: middle;
	}
	
	
	
	#button_sin_mok {
	    margin-top: 35%;
	    position: absolute;
	    margin-left: 30%;
	}

	textarea {
   		width: 60%;
   		height: 30%;
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
			
				<h5 id="aAp" style="text-decoration: underline; text-decoration-color:  skyblue; color: skyblue;"><a href="approvalEventRequest.go">이벤트신청</a></h5>
				<h5 id="aAp"><a href="approvalExpenseReport.go">지출결의서</a></h5>
				<h5 id="aAp"><a href="approvalVacationRequest.go">휴가신청</a></h5>
				
			
				<div id="table1_div">
					<form action="approvalEventRequest.do" method="post" enctype="multipart/form-data">
					<table id="table1">
						<tr>
							<th>기안자</th>
							<td>
								${loginIdName}
							</td>
						</tr>
						<tr>
							<th>기안일</th>
							<td><span id="date"></span></td>
						</tr>
						<tr>
							<th>결재구분</th>
							<td>이벤트신청</td>
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
							<td>${top_manager }</td>
						</tr>
					</table>
					</c:if>	
					
					<c:if test="${position eq '지점장'}">
					<table id="table3_1">
						<tr id="tr11">
							<th rowspan="3">신청</th>
							<th>지점장</th>
							<th rowspan="3">결재</th>
							<th>대표</th>
						</tr>
						<tr id="tr22">
							<td>${loginIdName}</td>
							<td>${top_manager }</td>
						</tr>
					</table>
					</c:if>	
				
				
				<table id="table2">
					<tr>
						<th>제목</th>
						<td><input type="text" name="subject" id="subject"/></td>
					</tr>
					<tr>
						<th>기간</th>
						<td><input type="date" name="start_day" id="start_day"/>&nbsp;&nbsp;~&nbsp;&nbsp;<input type="date" name="finish_day" id="finish_day"/></td>
					</tr>
					<tr>
						<th>사유</th>
						<td><textarea id="sa" name="reason" class="reason"></textarea></td>
					</tr>
					<tr>
						<th>기타사항</th>
						<td><textarea id="sa" name="etc" class="etc"></textarea></td>
					</tr>
					<tr>
						<th>첨부파일</th>
						<td><input type="file" name="files" multiple="multiple" class="files"/></td>
					</tr>
				</table>
				<div id="button_sin_mok">
					<button type="submit" id="sin" formaction="approvalEventRequest.do">신청하기</button>
					<button type="submit" id="mm" formaction="saveRequest.do" onclick="save()">임시저장</button>
					<button type="button" id="mok" onclick="location.href='approvalList.do'">목록</button>
				</div>
				<input type="hidden" name="emp_no" value="${loginId}"/>
				<input type="hidden" name="approval" value="이벤트신청"/>
				<input type="hidden" name="state" value="대기"/>
				<input type="hidden" name="manager" value="${manager}"/>
				<input type="hidden" name="top_manager" value="${top_manager}"/>
				</form>
			</div>
		</div>	
			<!--/. container-fluid -->
		</section>
	</div>
</body>
<script type="text/javascript">

var msg = "${msg}";
if(msg != ""){
	alert(msg);
}
	var currentDate = new Date();
	var year = currentDate.getFullYear();
	var month = ('0' + (currentDate.getMonth() + 1)).slice(-2); // 월이 한 자리 수일 경우 앞에 0을 추가하여 두 자리로 만듦
	var day = ('0' + currentDate.getDate()).slice(-2); // 일이 한 자리 수일 경우 앞에 0을 추가하여 두 자리로 만듦
	
	var dateSpan = document.getElementById("date");
	dateSpan.textContent = year + "-" + month + "-" + day;
	
	function save(){
		if($('#subject').val()==null ){
			alert("제목을 입력해주세요");
		}
	}
	
</script>
</html>