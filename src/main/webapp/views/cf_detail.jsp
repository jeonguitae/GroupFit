<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>출퇴근 변경 처리 상세</title>

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
					<h1>출퇴근 변경 요청서</h1>
               </div>
               <div class="col-sm-6">
                  <!-- <ol class="breadcrumb float-sm-right">
                     <li class="breadcrumb-item"><a href="#">메인</a></li>
                     <li class="breadcrumb-item active">뎁스1</li>
                     <li class="breadcrumb-item active">뎁스2</li>
                  </ol> -->
               </div>
            </div>
         </div>
         <!-- /.container-fluid -->
      </section>
<!-- Main content -->
      <section class="content">
         <div class="container-fluid">
    <table class="table second">
        <colgroup>
            <col width="15%"/>
            <col width="20%"/>
            <col width="15%"/>
            <col width="15%"/>
            <col width="15%"/>
            <col width="10%"/>
            <col width="10%"/>
        </colgroup>
        <thead>
            <tr>
                <th style="text-align: center;">변경요청일</th>
                <th style="text-align: center;">이름</th>
                <th style="text-align: center;">직위</th>
                <th style="text-align: center;">출근 시간</th>
                <th style="text-align: center;">퇴근 시간</th>
                <th style="text-align: center;">총 근무 시간</th>
                <th style="text-align: center;">출결 상태</th>
            </tr>
        </thead>        
        <tbody>
            <%-- <c:forEach items="${working}" var="working"> --%>
                <c:if test="${not empty sessionScope.loginId}">
                    <tr>
                        <td style="text-align: center;">${working.reg_date}</td> 
                        <td style="text-align: center;">${working.name}</td>
                        <td style="text-align: center;">${working.position}</td>                      
                        <td style="text-align: center;">${working.come_time}</td>
                        <td style="text-align: center;">${working.out_time}</td>
                        <td style="text-align: center;">${String.format('%.1f', (working.out_time.time - working.come_time.time) / (1000.0 * 60 * 60))} </td>                       
                        <td style="text-align: center;">${working.w_type}</td>
                    </tr>
                </c:if>         
            <%-- </c:forEach> --%>
        </tbody>
        
       </table>
       <br>
       <hr>
       <br>
       <h3 style="text-align: center;">변경 요청서</h3>
       				<table id="table2"  class="table table-hover"  style="text-align:center; margin:0 auto; justify-content: center; align-items: center; width:80%">
					<tr>
						<th style="text-align: center;">제목</th>
                        <td style="text-align: center;">${working.title}</td> 
					</tr>
					<tr>
						<th style="text-align: center;">변경 요청 사안</th>
						 <td style="text-align: center;">${working.com_category}</td> 		
					</tr>
					<tr>
						<th>희망 변경 일시</th>
						<td style="text-align: center;">${working.r_date} &nbsp; ${working.r_time}</td>
					</tr>		
					<tr>
						<th style="text-align: center;">변경 요청 사유</th>
						<td style="text-align: center;">${working.comment}</td> 		
					</tr>
				</table>
				<form action="/rconfirm.do" method="post">				
				<input type="hidden" name="r_idx" value="${r_idx}">
				<input type="hidden" name="com_category" value="${working.com_category}">
				<input type="hidden" name="r_date" value="${working.r_date}">				
				<input type="hidden" name="r_time" value="${working.r_time}">
				<input type="hidden" name="emp_no" value="${working.emp_no}">
	
	<br>
				<h3 style="text-align: center;">출퇴근 변경 요청 승인서</h3>
				<table id="table3" class="table" style="text-align:center; margin:0 auto; justify-content: center; align-items: center; width:80%">
					<tr>
						<th>처리</th>
						<td colspan="2">
							<input type="radio" name="status" value="승인" /> 승인 &nbsp;&nbsp;&nbsp;&nbsp;
							<input type="radio" name="status" value="반려" /> 반려
						</td>
					<tr>
						<th>처리인</th>
						<td colspan="2">지점장</td>
					</tr>
					<tr>
						<th>의견</th>
						<td colspan="2"><textarea id="sa" name="opinion" class="reason" required style="width:100%"></textarea></td>
					</tr>
				</table>
				<br>
				<div id="button_sin_mok" style="text-align:center; margin:0 auto; justify-content: center; align-items: center;">
					<input class="btn btn-secondary" type="button" onclick="location.href='/rlist.go'" value="이전"/>
					<input class="btn btn-primary" type="submit"/>
				</div>
				</form>
         </div>
         <!--/. container-fluid -->
      </section>
   </div>
   
</body>
</html>