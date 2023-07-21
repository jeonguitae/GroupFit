<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
      <section class="content-header">
         <div class="container-fluid">
            <div class="row mb-2">
               <div class="col-sm-6">

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
            <h1 class="forcenter">나의 근태관리</h1>
               <div class="togo">
               <a href="cwrite.go" id="detail">변경 요청 신청</a>
               <a href="myclist.go?emp_no=${emp_no}">변경 요청 내역</a>
               </div> 
               <button style="margin-left:36%" id="prevMonth" onclick="monthChange(-1)"><</button>
				  <span id="formattedDate"></span>
			  <button id="nextMonth" onclick="monthChange(1)">></button>
    <table class="table second">
        <colgroup>
            <col width="15%"/>
            <col width="20%"/>
            <col width="15%"/>
            <col width="20%"/>
            <col width="20%"/>
            <col width="10%"/>
        </colgroup>
        <thead>
            <tr>
                <th style="text-align: center;">날짜</th>
                <th style="text-align: center;">출근 시간</th>
                <th style="text-align: center;">퇴근 시간</th>
                <th style="text-align: center;">근무 시간</th>
                <th style="text-align: center;">출결 상태</th>
            </tr>
        </thead>        
        <tbody id="list">
            <c:if test="${working eq null}">
                <tr>
                    <th id="forblack" style="text-align:center;" colspan="6">근태내역이 없습니다.</th>
                </tr>
            </c:if>
            <c:if test="${working.size() == 0}">
               <tr>
               <th colspan="6">근태내역이 없습니다.</th>
               </tr>
            </c:if>
            <c:forEach items="${working}" var="working">
                <c:if test="${not empty sessionScope.loginId}">
                    <tr>
                        <td style="text-align: center;">${working.work_date}</td>
                        <td style="text-align: center;">${working.come_time}</td>
                        <!--<td style="text-align: center;"><a href="ndetail.do?n_idx=${bbs.n_idx}&flag='detail'" id="detail">${bbs.title}</a></td>  -->
                        <td style="text-align: center;">${working.out_time}</td>
                        <td style="text-align: center;">${String.format('%.1f', (working.out_time.time - working.come_time.time) / (1000.0 * 60 * 60))} </td>                       
                        <td style="text-align: center;">${working.w_type}</td>
                    </tr>
                </c:if>         
            </c:forEach>
        </tbody>
       </table>
      <input type="hidden" name="emp_no" value="${working.emp_no}"/>
         </div>
         <!--/. container-fluid -->
      </section>
   </div>
</body>

<script>

var currentDate = new Date();
var currentYear = currentDate.getFullYear();
var currentMonth = currentDate.getMonth();
var year = $('#formattedDate').text();
var emp_no = "${sessionScope.loginEmp.emp_no}";
console.log(emp_no);

function updateFormattedDate() {
  var formattedDateElement = document.getElementById("formattedDate");
  formattedDateElement.textContent = formatDate(currentYear, currentMonth);
  year = $('#formattedDate').text();
  $.ajax({
		type:'get',
		url:'workingList.ajax',
		data:{
			'year':year,
			"emp_no":emp_no
		},
		dataType:'json',
		success:function(data){
			console.log(data);
			listPrint(data.workList);
		},
		error:function(e){
			console.log(e);
		}
	});
}

function formatDate(year, month) {
  var formattedYear = year;
  var formattedMonth = String(month + 1).padStart(2, '0');
  return formattedYear + "-" + formattedMonth;
}

function monthChange(change) {
  currentMonth += change;

  if (currentMonth < 0) {
    currentMonth = 11;
    currentYear -= 1;
  } else if (currentMonth > 11) {
    currentMonth = 0;
    currentYear += 1;
  }
  
 

  // 현재 연도인 경우 다음 달로 이동하는 버튼을 비활성화합니다.
  var nextMonthButton = document.getElementById("nextMonth");
  if (nextMonthButton) {
    nextMonthButton.disabled = (currentYear === new Date().getFullYear() && currentMonth === new Date().getMonth());
  }

  updateFormattedDate();
}

var nextMonthButton = document.getElementById("nextMonth");
if (nextMonthButton) {
  nextMonthButton.disabled = (currentYear === new Date().getFullYear() && currentMonth === new Date().getMonth());
}

// 초기 날짜 설정
updateFormattedDate();

function listPrint(data){
	var content ='';
	console.log(data.length);
	if(data.length==0){
		content='근태내역이 없습니다.';
	}else{
		data.forEach(function(item,idx){
			content +='<tr>';
			content +='<td>'+item.emp_no+'</td>';
			content +='<td>'+item.work_date+'</td>';
			content +='<td>'+item.come_time+'</td>';
			content +='<td>'+item.out_time+'</td>';
            content +='<td>'+item.time_difference+'</td>'; 
            if(item.w_type=="계산"){
				content +='<td>결근</td>';
			}else{
				content +='<td>'+item.w_type+'</td>';
			}
			content +='</tr>';
		});
}
	$('#list').empty();
	$('#list').append(content);
}
	




</script>
</html>