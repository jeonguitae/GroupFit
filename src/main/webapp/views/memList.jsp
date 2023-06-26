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
		margin-left: 377px;
	}
	
	h1.headline{
		margin-left: 640px;
		margin-top: 20px;
	}
	
	div[class="table"]{
		margin-left: 376px;
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
<!-- Main content -->
      <section class="content">
            <h1 class="headline">일반 회원 리스트</h1>
			<form action="search.do" class="search">
				<select name="sortting">
					<option value="mem_no">회원번호</option>
					<option value="name">이름</option>
					<option value="pt_chk">pt여부</option>
				</select>
				
				<input type="text" name="txt" value="" placeholder="검색어를 입력하세요"/>
				
				<button>검색</button>
			</form>	
					
			<div class="btn1">		
				<button onclick="location.href='memWrite.go'">등록</button>
				<button onclick="memdel()">삭제</button>
			</div>
			
		<div class="table">
			<table>
				<colgroup>
					<col width="15%"/>
					<col width="15%"/>
					<col width="15%"/>
					<col width="40%"/>
					<col width="15%"/>
				</colgroup>
				<thead>
					<tr>
						<th>삭제</th>
						<th>회원번호</th>
						<th>이름</th>
						<th>등록기간</th>
						<th>피티 등록여부</th>
					</tr>
				</thead>		
				<tbody id="memlist">
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

memlist();

function memlist(){
	$.ajax({
		type:'get',
		url:'memlist.ajax',
		data:{},
		dataType:'json',
		success:function(data){
			listDraw(data.list);
		},
		error:function(e){
			console.log(e);
		}
	});	
}

function listDraw(memlist){
	//console.log(list);
	var content = '';
	memlist.forEach(function(item,index){
		content += '<tr>';
		content += '<td><input type="checkbox" value="'+item.mem_no+'"/></td>';
		content+='<td>'+item.mem_no+'</td>';
		content+='<td><a href="memdetail.go?mem_no='+item.mem_no+'">'+item.name+'</a></td>';
		content+='<td>'+item.start_date+'~'+item.end_date+'</td>';
		content+='<td>'+item.start_date+'</td>';		
		content += '</tr>';
	});
	$('#memlist').empty();
	$('#memlist').append(content);
}

$('#all').click(function(e){	
	var $chk = $('input[type="checkbox"]');
	console.log($chk);
	if($(this).is(':checked')){
		$chk.prop('checked',true);
	}else{
		$chk.prop('checked',false);
	}	
});

function memdel(){
	
	var checkArr = [];
	
	$('input[type="checkbox"]:checked').each(function(idx,item){		
		//checkbox 에 value 를 지정하지 않으면 기본값을 on 으로 스스로 지정한다.
		if($(this).val()!='on'){
			//console.log(idx,$(this).val());
			checkArr.push($(this).val());
		}	
	});
	
	console.log(checkArr);
		
	$.ajax({
		type:'get',
		url:'memdel.ajax',
		data:{'delList':checkArr},
		dataType:'json',
		success:function(data){
			console.log(data);
			if(data.success){
				alert(data.msg);
				memlist();
			}
		},
		error:function(e){
			console.log(e);
		}		
	});
	
}
</script>
</html>