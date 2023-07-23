<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<style>
	table, th, td{
		border-collapse: collapse;
		margin: 5px;
	}
	
	    .container {
        max-width: 800px;
        margin: 0 auto;
    }
    
	
	/* div[class="table 1"]{
		z-index: 1;
	}
	
	div.block1{
		width: 100%;
        height: 100%;
        background-color: black;
        opacity: 0.3;
        z-index: 2;
	}
	
	div[class="table 2"]{
		z-index: 1;
	}
	
	div.block2{
		width: 100%;
        height: 100%;
        background-color: black;
        opacity: 0.3;
        z-index: 2;
	} */
	
</style>
<meta charset="UTF-8">
<title>회원정보 등록</title>
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
<jsp:include page="GroupFit_gnb.jsp"/>
<body>
   <div class="content-wrapper" style="margin-top: 57.08px">
  <!--  <section class="content-header">
			<div class="container-fluid">
				<div class="row mb-2">
					<div class="col-sm-6">
						<h1>페이지 제목</h1>
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
			/.container-fluid
			</section> -->
<!-- Main content -->
      <section class="content">
         <div class="container-fluid">
         		<h2>회원정보 등록</h2>
         			<div class="container">
         			
	         		<div class="table 1">
			         	

			         		
			         		<div class="row mb-3">
							    <label for="name" class="col-sm-2 col-form-label">이름</label>
							    <div class="col-sm-10">
							      <input type="text" class="form-control" name="name">
							    </div>
							  </div>
							  
							  <div class="row mb-3">
							    <label for="name" class="col-sm-2 col-form-label">생년월일</label>
							    <div class="col-sm-10">
							      <input type="date" class="form-control" name="birth">
							    </div>
							  </div>
							  
							  
							  <div class="row mb-3">
								  <label for="name" class="col-sm-2 col-form-label">성별</label>
								  <div class="col-sm-10">
								    <div class="form-check form-check-inline">
								      <input class="form-check-input" type="radio" name="gender" value="여" id="inlineRadio1">
								      <label class="form-check-label" for="inlineRadio1">여자</label>
								    </div>
								    <div class="form-check form-check-inline">
								      <input class="form-check-input" type="radio" name="gender" value="남" id="inlineRadio2">
								      <label class="form-check-label" for="inlineRadio2">남자</label>
								    </div>
								  </div>
								</div>
								
								
								<div class="row mb-3">
							    <label for="name" class="col-sm-2 col-form-label">연락처</label>
							    <div class="col-sm-10">
							      <input type="text" class="form-control" name="phone">
							    </div>
							  </div>
							  
							  
							  <div class="row mb-3">
			         		  <label for="loc_no" class="col-sm-2 col-form-label">라커 번호</label>
								  <div class="col-sm-10">
								    <select class="form-select" name="loc_no" id="loc_no">
								      <c:forEach items="${locker}" var="name">
								        <option value="${name.loc_no}">${name.loc_no}</option>
								      </c:forEach>
								    </select>
								  </div>
								</div>
							</div>
							
		         	<button class="btn btn-primary" onclick="memjoin()">등록</button>
					<input type="button" class="btn btn-primary" onclick="location.href='/memlist.go'" value="이전"/>
	
	         	<hr/>
	         	
		         	<h2>이용권 등록</h2>
			         	<div class="table 2">
			         	

			         		<div class="row mb-3">
			         		  <label for="loc_no" class="col-sm-2 col-form-label">이용권</label>
								  <div class="col-sm-10">
								    <select class="form-select" name="ticket_name">
								     	<c:forEach items="${ticket}" var="name">
											<option value="${name.ticket_name}">${name.ticket_name}
										</c:forEach>
								    </select>
								  </div>
								</div>
							

								
								<div class="row mb-3">
							    <label for="name" class="col-sm-2 col-form-label">판매자(사번)</label>
							    <div class="col-sm-10">
							      <input type="text" class="form-control" name="emp_no" value="${sessionScope.loginId}" readonly="readonly">
							    </div>
							  </div>
							  

								<div class="row mb-3">
							    <label for="name" class="col-sm-2 col-form-label">회원번호</label>
							    <div class="col-sm-10">
							      <input type="text" class="form-control" name="mem_no" value="" readonly="readonly">
							    </div>
							  </div>
								

								
								<div class="row mb-3">
							    <label for="name" class="col-sm-2 col-form-label">이용권 시작일자</label>
							    <div class="col-sm-10">
							      <input type="date" class="form-control" name="start_date">
							    </div>
							  </div>
								

								
								<div class="row mb-3">
			         		  <label for="loc_no" class="col-sm-2 col-form-label">지점</label>
								  <div class="col-sm-10">
								    <select class="form-select" name="branch">
								     	<c:forEach items="${branch}" var="name">
											<option value="${name.b_name}">${name.b_name}
										</c:forEach>
								    </select>
								  </div>
								</div>
							

							
						</div>
						<button class="btn btn-primary" onclick="ticketjoin()">등록</button>
						<input type="button" class="btn btn-primary" onclick="location.href='/memlist.go'" value="이전">
         			</div>
         		</div> 
         	
         <!--/. container-fluid -->
      </section>
   </div>
			
</body>
<script>

var mem_no;

function memjoin(){
	
	var $name = $('input[name="name"]');
	var $birth = $('input[name="birth"]');
	var $gender = $('input[name="gender"]:checked');
	var $phone = $('input[name="phone"]');
	var $loc_no = $('select[name="loc_no"]');
	
	var param = {};
	
	param.name = $name.val();
	param.birth = $birth.val();
	param.gender = $gender.val();
	param.phone = $phone.val();
	param.loc_no = $loc_no.val();
	
	$.ajax({
		type:'post',
		url:'memjoin.ajax',
		data:param,
		dataType:'json',
		success:function(data){
			console.log(data);
			if(data.success == 1){
				alert('기본정보 등록이 완료 되었습니다.');
				mem_no = data.mem_no;
				$('input[name="mem_no"]').val(mem_no);
			}else{
				alert('기본정보 등록에 실패 했습니다.\r\n 다시 시도해 주세요!');
			}
		},
		error:function(e){
			console.log(e);
			alert('기본정보 등록에 실패 했습니다.\r\n 다시 시도해 주세요!');
		}
	});
}

function ticketjoin(){
	
	var $ticket_name = $('select[name="ticket_name"]');
	var $emp_no = $('input[name="emp_no"]');
	var $mem_no = $('input[name="mem_no"]');
	var $start_date = $('input[name="start_date"]');
	var $branch = $('select[name="branch"]');
	
	var param = {};
	
	param.ticket_name = $ticket_name.val();
	param.emp_no = $emp_no.val();
	param.mem_no = $mem_no.val();
	param.start_date = $start_date.val();
	param.branch = $branch.val();
	
	$.ajax({
		type:'post',
		url:'ticjoin.ajax',
		data:param,
		dataType:'json',
		success:function(data){
			console.log(data);
			if(data.success == 1){
				alert('이용권 정보 등록이 완료 되었습니다.');
				
				if(data.ticket_type == ('일반')){
					location.href = 'memlist.go';
				}
				
				else{
					location.href = 'ptmemJoin.go?mem_no='+data.mem_no+'&ticket_no='+data.ticket_no+'&ticket_time='+data.count;
				}
				
			}else{
				alert('이용권 정보 등록에 실패 했습니다.\r\n 다시 시도해 주세요!');
			}
		},
		error:function(e){
			console.log(e);
			alert('이용권 정보 등록에 실패 했습니다.\r\n 다시 시도해 주세요!');
		}
	});
}
</script>
</html>