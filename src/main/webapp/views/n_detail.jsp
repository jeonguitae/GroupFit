<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항 상세</title>
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
						<h1>공지사항 상세</h1>
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
				<div class="table table-bordered">
		<table>
		<colgroup>
			<col width="20%">
			<col width="80%">
		</colgroup>
			<tr>
				<th>제목</th>
				<td>${dto.title}</td>
			</tr>
			<tr>
				<th>작성자</th>
				<td>${dto.position}</td>
			</tr>
			<tr>
				<th>작성일시</th>
				<td>${dto.reg_date}</td>
			</tr>
			<tr>
				<th>내용</th>
				<td>${dto.content}</td>
			</tr>
			<tr>
				<th>사진 및 파일</th>
				<td>
					<c:forEach items="${photos}" var="photo">
						<img width="500" src="/photo/${photo.new_photo_name}"/>
						<input type="button" onclick="location.href='ndownload.do?path=${photo.new_photo_name}'" value="다운로드">
					</c:forEach>
					</td>
			</tr>			
		</table>
					<input type="button" onclick="location.href='nlist.go'" value="목록"/>
					<c:if test="${sessionScope.loginEmp.position == '지점장' || sessionScope.loginEmp.position == '대표'}">
					<input type="button" onclick="location.href='nupdate.go?n_idx=${dto.n_idx}'" value="수정"/>
					<input type="button" onclick="location.href='ndelete.do?n_idx=${dto.n_idx}'" value="삭제"/>
					<button class="forsave">저장</button>
					</c:if >
		</div>
		<br>
		<c:if test="${sessionScope.loginEmp.position == '지점장' || sessionScope.loginEmp.position == '대표'}">
		
		<h3>읽은 직원 목록</h3>
		<table>
			<thead>
            <tr>
                <th>이름</th>
                <th>사내번호</th>
                <th>조회일</th>              
            </tr>
        </thead>  
        <tbody> 
			<c:if test="${reader eq null }">
				<tr> 
					<td colspan="3" id="fornull" style="text-align:center">아직 읽은 직원이 없습니다.</td>			
				</tr>
			</c:if >
			<c:if test="${reader.size()==0}">
				<tr> 
					<td colspan="3" id="forzero" style="text-align:center">아직 읽은 직원이 없습니다.</td>			
				</tr>
			</c:if >
			<c:forEach items="${reader}" var="reader">
				<tr>
					 <td style="text-align: center;">${reader.name}</td>
					 <td style="text-align: center;">${reader.emp_no}</td>
					 <td style="text-align: center;">${reader.read_date}</td>
				</tr>
			</c:forEach>
			</tbody>
		</table>
	</c:if>
			</div>
			<!--/. container-fluid -->
		</section>
	</div>
</body>
</html>




		
	
	


<%-- var loginId = "${sessionScope.loginId}";  
myHobbyList();
function myHobbyList(){
   console.log("loginId : " + loginId);
   $.ajax({
      type:'get',
      url:'myHobbyList.ajax',
      data:{id:loginId},
      dataType:'json',
      success:function(data){
         console.log("data, myHobbyList : " + data.myHobbyList);
         console.log("data, login : " + data.login);
         if(!true){
            alert('로그인이 필요한 서비스 입니다.');
            location.href='./';
         }else{
            myHobbyListDraw(data.myHobbyList);
         }
      },
      error:function(e){
         console.log(e);
      }
   });  
}


function myHobbyListDraw(myHobbyList){
   console.log("myHobbyList : " + myHobbyList);
   var content = '';
   myHobbyList.forEach(function(item,index){
      content += '<tr>';
      content += '<td><input type="checkbox" value="'+item.my_hobby_no+'"/></td>';
      content+='<td>'+item.big_hb + " / " + item.small_hb+'</td>';
      content += '</tr>';
      console.log(item.my_hobby_no);
   });
   
   $('#myHobbyList').empty();
   $('#myHobbyList').append(content);
}

$('#big_hb').on('change', function(e){
    var big_hb = $('#big_hb').val();      
    console.log("big_hb ? " + big_hb);      
    $.ajax({
       type: 'get'
       ,url: 'big_hb.ajax'
       ,data:{'big_hb':big_hb}
       ,dataType:'json'
       ,success:function(data){
          console.log("big_hb data : " + data.small_hb);
          if(data != ""){
             console.log("big_hb 취미 호출");
             small_hbDraw(data.small_hb);
          } else {
             alert('오류가 발생하였습니다.');
          }
       }
       ,error:function(e){
          console.log(e);
       }
    });
})

	function small_hbDraw(small_hb){
 		console.log("small_hb : " + small_hb);
		 var content = '';
		 small_hb.forEach(function(item,index){
		    content +='<option value="'+item.small_hb+'">'+item.small_hb+'</option>';
		 });
		 $('#small_hb').empty();
		 $('#small_hb').append(content);
		}
			$('.writefin').on('click',function(){
				alert("글이 저장되었습니다.");
			}) --%>
<!-- </script> -->
</html>