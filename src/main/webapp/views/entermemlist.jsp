<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>여기에 페이지 이름 입력</title>
<style>
/* table, th, td{
		border: 1px solid white;
		border-collapse: collapse;
	} */
	
	div[class="btn1"]{
		margin-left: 1108px;
	}
	
	form[class="search"]{
		margin-left: 514px;
	}
	
	h1.headline{
		margin-left: 640px;
		margin-top: 20px;
	}
	
	div[class="table"]{
		margin-left: 513px;
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
   <div class="content-wrapper" style="margin-top: 57.08px">
   <section class="content-header">
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
			<!-- /.container-fluid -->
			</section>
<!-- Main content -->
      <section class="content">
            <h1 class="headline"></h1>
				<h2 class="headline">입장한 회원</h2>
				<select name="esortting">
					<option value="mem_no">회원번호</option>
					<option value="name">이름</option>
				</select>
				
				<input type="text" name="txt" value="" placeholder="검색어를 입력하세요"/>
				
				<button onclick="entermemsearch()">검색</button>
			
		<div class="table">
			<table>
				<colgroup>
					<col width="20%"/>
					<col width="20%"/>
					<col width="20%"/>
					<col width="20%"/>
					<col width="20%"/>
				</colgroup>
				<thead>
					<tr>
						<th>회원번호</th>
						<th>이름</th>
						<th>연락처</th>
						<th>입장 일</th>
						<th>입장 시간</th>
					</tr>
				</thead>		
				<tbody id="entermemlist">
					<%-- <c:if test="${list.size() == 0}">
			               <tr>
			               		<th colspan="5">조건에 해당하는 게시물이 없습니다.</th>
			               </tr>
		            </c:if>
					<c:forEach items="${list}" var="bbs">
							<tr>
								<td>${bbs.mem_no}</td>
								<td><a href="memDetail.do?mem_no=${bbs.mem_no}">${bbs.name}</a></td>
								<td>${bbs.start_date} ~ ${bbs.end_date}</td>
								<td>${bbs.start_date}</td>
								<td><a href="memDel.do?mem_no=${bbs.mem_no}">삭제</a></td>
							</tr>
					</c:forEach> --%>
				</tbody>
			</table> 
         </div>
         <!--/. container-fluid -->
      </section>
   </div>
</body>
<script>

entermemlist();

function entermemlist(){
	$.ajax({
		type:'get',
		url:'entermemlist.ajax',
		data:{},
		dataType:'json',
		success:function(data){
			console.log(data.list);
			listDraw(data.list);
		},
		error:function(e){
			console.log(e);
		}
	});	
}

function listDraw(entermemlist){
	//console.log(list);
	var content = '';
	entermemlist.forEach(function(item,index){
		
		content += '<tr>';
		content += '<td>'+item.mem_no+'</td>';
		content += '<td><a href="memdetail.go?mem_no='+item.mem_no+'">'+item.name+'</a></td>';
		content += '<td>'+item.phone+'</td>';
		content += '<td>'+item.enter_date+'</td>';	
		content += '<td>'+item.enter_time+'</td>';
		content += '</tr>';
	});
	$('#entermemlist').empty();
	$('#entermemlist').append(content);
}

</script>
</html>