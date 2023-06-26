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
<body>
   <jsp:include page="GroupFit_gnb.jsp" />
   <div class="content-wrapper" style="margin-top: 57.08px">
<!-- Main content -->
      <section class="content">
         <div class="container-fluid">
            pt 회원정보 입력
         </div>
         	<div class="table 1">
			         	<table>
			         		<tr>
			         			<th>회원번호</th>
			         				<td>
			         					<input type="text" name="mem_no" value="${mem_no}" readonly="readonly"/>
			         				</td>
			         		</tr>
			         		
			         		<tr>
			         			<th>등록한 이용권 번호</th>
			         				<td>
			         					<input type="text" name="ticket_no" value="${ticket_no}" readonly="readonly"/>
			         				</td>
			         		</tr>
			         		
			         		<tr>
			         			<th>현재 체중</th>
			         				<td>
			         					<input type="text" name="weight" value=""/>
			         				</td>
			         		</tr>
			         		
			         		<tr>
			         			<th>목표</th>
			         				<td>
			         					<textarea name="goal"></textarea>
			         				</td>
			         		</tr>
			         		
			         		<tr>
			         			<th>특이사항</th>
			         				<td>
			         					<textarea name="str"></textarea>
			         				</td>
			         		</tr>
			         		
			         		<tr>
			         			<th>잔여pt횟수</th>
			         				<td>
			         					<input type="text" name="ticket_time" value="${ticket_time}" readonly="readonly"/>
			         				</td>
			         		</tr>
			         	</table>
			        </div>
		         	<button onclick="ptmemjoin()">등록</button>
					<input type="button" onclick="location.href='/memlist.go'" value="이전"/>
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
				location.href = '/memlist.go';
				
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