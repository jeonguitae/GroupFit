<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
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
<style>

	    .container {
        max-width: 800px;
        margin: 0 auto;
    }

</style>
<body>
   <jsp:include page="GroupFit_gnb.jsp" />
   
   <div class="content-wrapper" style="margin-top: 57.08px">
		<section class="content-header">
			<div class="container-fluid">
				<div class="row mb-2">
					<div class="col-sm-6">
						<h1>pt 회원정보 입력</h1>
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
           	
           		<div class="container">
         
         		<div class="table 1">
         	
         	
         			<div class="row mb-3">
							    <label for="name" class="col-sm-2 col-form-label">회원번호</label>
							    <div class="col-sm-10">
							      <input type="text" class="form-control" name="mem_no" value="${mem_no}" readonly="readonly">
							    </div>
							  </div>
         	
			         	
			         		<%-- <tr>
			         			<th>회원번호</th>
			         				<td>
			         					<input type="text" name="mem_no" value="${mem_no}" readonly="readonly"/>
			         				</td>
			         		</tr> --%>
			         		
			         		
			         		<div class="row mb-3">
							    <label for="name" class="col-sm-2 col-form-label">등록한 이용권 번호</label>
							    <div class="col-sm-10">
							      <input type="text" class="form-control" name="ticket_no" value="${ticket_no}" readonly="readonly">
							    </div>
							  </div>
							  
			         		
			         		<%-- <tr>
			         			<th>등록한 이용권 번호</th>
			         				<td>
			         					<input type="text" name="ticket_no" value="${ticket_no}" readonly="readonly"/>
			         				</td>
			         		</tr> --%>
			         		
			         		
			         		<div class="row mb-3">
							    <label for="name" class="col-sm-2 col-form-label">현재 체중</label>
							    <div class="col-sm-10">
							      <input type="text" class="form-control" name="weight" value="">
							    </div>
							  </div>
			         		
			         		
			         		<!-- 
			         		<tr>
			         			<th>현재 체중</th>
			         				<td>
			         					<input type="text" name="weight" value=""/>
			         				</td>
			         		</tr>
			         		 -->
			         		 
			         		 
			         		 <div class="row mb-3">
							    <label for="name" class="col-sm-2 col-form-label">목표</label>
							    <div class="col-sm-10">
							      <textarea class="form-control" name="goal"></textarea>
							    </div>
							  </div>
			         		 
			         	<!-- 	 
			         		<tr>
			         			<th>목표</th>
			         				<td>
			         					<textarea name="goal"></textarea>
			         				</td>
			         		</tr> -->
			         		
			         		
			         		 <div class="row mb-3">
							    <label for="name" class="col-sm-2 col-form-label">특이사항</label>
							    <div class="col-sm-10">
							      <textarea class="form-control" name="str"></textarea>
							    </div>
							  </div>
			         		
			         		
			         		
			         		<div class="row mb-3">
							    <label for="name" class="col-sm-2 col-form-label">잔여pt횟수</label>
							    <div class="col-sm-10">
							      <input type="text" class="form-control" name="ticket_time" value="${ticket_time}" readonly="readonly">
							    </div>
							  </div>
			         		
			         		
			         		<%-- <tr>
			         			<th>잔여pt횟수</th>
			         				<td>
			         					<input type="text" name="ticket_time" value="${ticket_time}" readonly="readonly"/>
			         				</td>
			         		</tr> --%>
			         	
			        </div>
		         	<button class="btn btn-primary" onclick="ptmemjoin()">등록</button>
					<input type="button" class="btn btn-primary" onclick="location.href='/memlist.go'" value="이전"/>
     			</div>
     			</div>
      </section>
   </div>
</body>
<script>
function ptmemjoin(){
	
	var $mem_no = $('input[name="mem_no"]');
	var $ticket_no = $('input[name="ticket_no"]');
	var $weight = $('input[name="weight"]');
	var $goal = $('textarea[name="goal"]');
	var $str = $('textarea[name="str"]');
	var $ticket_time = $('input[name="ticket_time"]');
	
	var param = {};
	
	param.mem_no = $mem_no.val();
	param.ticket_no = $ticket_no.val();
	param.weight = $weight.val();
	param.goal = $goal.val();
	param.str = $str.val();
	param.ticket_time = $ticket_time.val();
	
	$.ajax({
		type:'post',
		url:'ptmemjoin.ajax',
		data:param,
		dataType:'json',
		success:function(data){
			console.log(data);
			if(data.success == 1){
				alert('pt정보 등록이 완료 되었습니다.');
				location.href = 'memlist.go';
				
			}else{
				alert('pt정보 등록에 실패 했습니다.\r\n 다시 시도해 주세요!');
			}
		},
		error:function(e){
			console.log(e);
			alert('pt정보 등록에 실패 했습니다.\r\n 다시 시도해 주세요!');
		}
	});
}
</script>
</html>