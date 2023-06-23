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
<body>
   <jsp:include page="GroupFit_gnb.jsp"/>
   <div class="content-wrapper" style="margin-top: 57.08px">
<!-- Main content -->
      <section class="content">
         <div class="container-fluid">
         		<h2>회원정보 등록</h2>
	         		<div class="table 1">
			         	<table>
			         		<tr>
			         			<th>이름</th>
			         				<td>
			         					<input type="text" name="name" value=""/>
			         				</td>
			         		</tr>
			         		
			         		<tr>
			         			<th>생년월일</th>
			         				<td>
			         					<input type="date" name="birth">
			         				</td>
			         		</tr>
			         		
			         		<tr>
			         			<th>성별</th>
			         				<td>
			         					<input type="radio" name="gender" value="남자"/>남자
			         					&nbsp; &nbsp; &nbsp; &nbsp;
			         					<input type="radio" name="gender" value="여자"/>여자
			         				</td>
			         		</tr>
			         		
			         		<tr>
			         			<th>연락처</th>
			         				<td>
			         					<input type="text" name="phone" value=""/>
			         				</td>
			         		</tr>
			         	</table>
			        </div>
		         	<button onclick="memjoin()">등록</button>
					<input type="button" onclick="location.href='/memlist.go'" value="이전"/>
		        
	         	<hr/>
	         	
		         	<h2>이용권 등록</h2>
			         	<div class="table 2">
				         	<table>
								<tr>
									<th>이용권</th>
										<td>
											<select name="ticket_name">
												<c:forEach items="${ticket}" var="name">
													<option value="${name.ticket_name}">${name.ticket_name}
												</c:forEach>
											</select>
										</td>
								</tr>
								
								<tr>
									<th>판매자(사번)</th>
									<td>
										<input type="text" name="emp_no" value="${sessionScope.loginId}" readonly="readonly"/>
									</td>
								</tr>
								
								<tr>
									<th>회원번호</th>
									<td>
										<input type="text" name="mem_no" value="" readonly="readonly"/>
									</td>
								</tr>
								
								<tr>
									<th>이용권 시작일자</th>
									<td>
										<input type="date" name="start_date">
									</td>
								</tr>
								
								<tr>
									<th>지점</th>
									<td>
										<select name="branch">
											<c:forEach items="${branch}" var="name">
												<option value="${name.b_name}">${name.b_name}
											</c:forEach>
										</select>
									</td>
								</tr>
							</table>
						</div>
						<button onclick="ticketjoin()">등록</button>
						<input type="button" onclick="location.href='/memlist.go'" value="이전">
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
	var $gender = $('input[name="gender"]');
	var $phone = $('input[name="phone"]');
	
	var param = {};
	
	param.name = $name.val();
	param.birth = $birth.val();
	param.gender = $gender.val();
	param.phone = $phone.val();
	
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
				
				if(data.ticket_no >= 1 && data.ticket_no <= 4){
					location.href = 'memlist.go';
				}
				
				else{
					location.href = 'ptmemJoin.go?mem_no='+data.mem_no+'&ticket_no='+data.ticket_no+'&ticket_time='+data.ticket_time;
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