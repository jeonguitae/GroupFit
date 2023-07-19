<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>출퇴근 변경 요청서 작성</title>	
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<style>

	#aAp{
		margin-left: 70px;
		margin-top: 20px;
		display: inline;
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
						<h1>출퇴근 변경 요청서 작성</h1>
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
			<div class="container-fluid">
			
				
			
	
					

				
			<form action="cwrite.do" method="post" enctype="multipart/form-data">				
				<table id="table2">
					<tr>
						<th>제목</th>
						<td><input type="text" name="title" id="title" required/></td>
					</tr>
					<tr>
						<th>일시</th>
						<td><input type="date" name="r_date" id="r_date" required/></td>
						<td><input type="time" name="r_time" id="r_time" required/></td>	
					</tr>
					<tr>
						<th>변경 요청 사안</th>
						<td><input type="radio" name="com_category" value="출근" required/>출근</td>
						<td><input type="radio" name="com_category" value="퇴근" required/>퇴근</td>	
					</tr>
					<tr>
						<th>변경 요청 사유</th>
						<td><textarea id="sa" name="comment" class="reason" required></textarea></td>
					</tr>
				</table>
				<div id="button_sin_mok">
					<input type="button" onclick="location.href='/wlist.do'" value="취소"/>
					<button class="forsave">제출</button>
				</div>
				<input type="hidden" name="emp_no" value="${loginId}"/>

				</form>
			</div>
		</div>
			<!--/. container-fluid -->
		

</body>
<script type="text/javascript">

var msg = "${msg}";
if(msg != ""){
	alert(msg);
}

	
</script>
</html>