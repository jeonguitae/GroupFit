<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	.nwt{
		color: white;
	}
	th{
		text-align: center;
	}
	table, th, td{
		/* border : 1px solid white;
		border-collapse: collapse; */
		padding : 5px 10px;
		width : 800px;
		margin-left : 700px;
		margin-top : 200px;
	}
	input.title, input.user, textarea.content{
		width : 660px;
	}
</style>
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
		<h1 class="nwt">공지사항 작성</h1>
	<form action="fwrite.do" method="post" enctype="multipart/form-data">
		<table>
		<colgroup>
			<col width="20%">
			<col width="80%">
		</colgroup>
			<tr>
				<th>제목</th>
				<td><input class="title" type="text" name="title"/></td>
			</tr>
			<tr>
				<th>작성자</th>
				<td><input type="text" name="id" value="${sessionScope.loginId}" readonly/></td>
			</tr>
			<tr>
				<th>내용</th>
				<td><textarea class="content" name="bContent"></textarea></td>
			</tr>
			<tr>
				<th>사진</th>
				<td>
					<input type="file" name="photo"/>
				</td>
			</tr>
			<tr>
				<th>첨부파일</th>
				<td> 
				</td>
			</tr>
			<tr>
				<th>고정 여부</th>
				<td>
					<input type="radio" name="option" value="고정">고정
				</td> 
			</tr>
		</table>
		<div class="nbutton">
					<input type="button" onclick="location.href='nlist.go'" value="목록"/>
					<button>저장</button>
		</div>	
	</form>
</body>

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