<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<style>
	div.meminfo. div.memprofile{
		float: center;
	}
</style>
<meta charset="UTF-8">
<title>여기에 페이지 이름 입력</title>
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
						<h1>출퇴근 내역</h1>
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
				<h2>7월</h2>
				<div class="header" style="display : flex;">
					<div style="width: 100px; height: 30px; border: 1px solid white; text-align: center">직원이름</div>
					<div style="width: 30px; height: 30px; border: 1px solid white; text-align: center">1</div>
					<div style="width: 30px; height: 30px; border: 1px solid white; text-align: center"></div>
					<div style="width: 30px; height: 30px; border: 1px solid white; text-align: center">3</div>
					<div style="width: 30px; height: 30px; border: 1px solid white; text-align: center">4</div>
					<div style="width: 30px; height: 30px; border: 1px solid white; text-align: center">5</div>
					<div style="width: 30px; height: 30px; border: 1px solid white; text-align: center">6</div>
					<div style="width: 30px; height: 30px; border: 1px solid white; text-align: center">7</div>
					<div style="width: 30px; height: 30px; border: 1px solid white; text-align: center">8</div>
					<div style="width: 30px; height: 30px; border: 1px solid white; text-align: center"></div>
					<div style="width: 30px; height: 30px; border: 1px solid white; text-align: center">10</div>
					<div style="width: 30px; height: 30px; border: 1px solid white; text-align: center">11</div>
					<div style="width: 30px; height: 30px; border: 1px solid white; text-align: center">12</div>
					<div style="width: 30px; height: 30px; border: 1px solid white; text-align: center">13</div>
					<div style="width: 30px; height: 30px; border: 1px solid white; text-align: center">14</div>
					<div style="width: 30px; height: 30px; border: 1px solid white; text-align: center">15</div>
					<div style="width: 30px; height: 30px; border: 1px solid white; text-align: center"></div>
					<div style="width: 30px; height: 30px; border: 1px solid white; text-align: center">17</div>
					<div style="width: 30px; height: 30px; border: 1px solid white; text-align: center">18</div>
					<div style="width: 30px; height: 30px; border: 1px solid white; text-align: center">19</div>
					<div style="width: 30px; height: 30px; border: 1px solid white; text-align: center">20</div>
					<div style="width: 30px; height: 30px; border: 1px solid white; text-align: center">21</div>
					<div style="width: 30px; height: 30px; border: 1px solid white; text-align: center">22</div>
					<div style="width: 30px; height: 30px; border: 1px solid white; text-align: center"></div>
					<div style="width: 30px; height: 30px; border: 1px solid white; text-align: center">24</div>
					<div style="width: 30px; height: 30px; border: 1px solid white; text-align: center">25</div>
					<div style="width: 30px; height: 30px; border: 1px solid white; text-align: center">26</div>
					<div style="width: 30px; height: 30px; border: 1px solid white; text-align: center">27</div>
					<div style="width: 30px; height: 30px; border: 1px solid white; text-align: center">28</div>
					<div style="width: 30px; height: 30px; border: 1px solid white; text-align: center">29</div>
					<div style="width: 30px; height: 30px; border: 1px solid white; text-align: center"></div>
					<div style="width: 30px; height: 30px; border: 1px solid white; text-align: center">31</div>
				</div>
				
				<div class="first_row" style="display : flex;">
					<!-- <div style="width: 150px; height: 150px; border: 1px solid white">1</div>
					<div style="width: 150px; height: 150px; border: 1px solid white">2</div>
					<div style="width: 150px; height: 150px; border: 1px solid white">3</div>
					<div style="width: 150px; height: 150px; border: 1px solid white">4</div>
					<div style="width: 150px; height: 150px; border: 1px solid white">5</div> -->
				</div>
				
				<br/>
				
				<div class="second_row" style="display : flex;">
					<!-- <div style="width: 150px; height: 150px; border: 1px solid white">1</div>
					<div style="width: 150px; height: 150px; border: 1px solid white">2</div>
					<div style="width: 150px; height: 150px; border: 1px solid white">3</div>
					<div style="width: 150px; height: 150px; border: 1px solid white">4</div>
					<div style="width: 150px; height: 150px; border: 1px solid white">5</div> -->
				</div>
				
				<br/>
				
				<div class="third_row" style="display : flex;">
					<!-- <div style="width: 150px; height: 150px; border: 1px solid white">1</div>
					<div style="width: 150px; height: 150px; border: 1px solid white">2</div>
					<div style="width: 150px; height: 150px; border: 1px solid white">3</div>
					<div style="width: 150px; height: 150px; border: 1px solid white">4</div>
					<div style="width: 150px; height: 150px; border: 1px solid white">5</div> -->
				</div>
				
				<br/>
				
				<div class="fourth_row" style="display : flex;">
					<!-- <div style="width: 150px; height: 150px; border: 1px solid white">1</div>
					<div style="width: 150px; height: 150px; border: 1px solid white">2</div>
					<div style="width: 150px; height: 150px; border: 1px solid white">3</div>
					<div style="width: 150px; height: 150px; border: 1px solid white">4</div>
					<div style="width: 150px; height: 150px; border: 1px solid white">5</div> -->
				</div>
			</div>
			<!--/. container-fluid -->
		</section>
	</div>
</body>
<script>

commutelist();

var july_date = ['2023-07-01', '2023-07-03', '2023-07-04', '2023-07-05', '2023-07-06'
	, '2023-07-07', '2023-07-08', '2023-07-10', '2023-07-11', '2023-07-12', '2023-07-13'
	, '2023-07-14', '2023-07-15', '2023-07-17', '2023-07-18', '2023-07-19', '2023-07-20'
	, '2023-07-21', '2023-07-22', '2023-07-24', '2023-07-25', '2023-07-26', '2023-07-27'
	, '2023-07-28', '2023-07-29', '2023-07-31'];

function commutelist(){
	
	$.ajax({
		type:'get',
		url:'commutelist.ajax',
		data:{
				'july_date' : july_date
			},
		dataType:'json',
		success:function(data){
			listDraw(data.list);
		},
		error:function(e){
			console.log(e);
		}
	});	
}
</script>
</html>