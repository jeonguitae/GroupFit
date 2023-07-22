<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>pt 회원 일지</title>
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
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
table {
	width: 100%;
	border: 1px solid black;
	border-collapse: collapse;
}

th, td {
	border: 1px solid black;
	padding: 5px 10px;
	text-align: center;
}

tfoot td {
	font-weight: bold;
}

.empty-data {
	text-align: center;
	padding: 10px;
}
</style>
<body>
	<jsp:include page="GroupFit_gnb.jsp" />
	<div class="content-wrapper" style="margin-top: 57.08px">
		<section class="content-header">
			<div class="container-fluid">
				<div class="row mb-2">
					<div class="col-sm-6">
						<h1>pt 회원 일지 리스트</h1>
					</div>
					
				</div>
			</div>
			<!-- /.container-fluid -->
		</section>
		<!-- Main content -->
		<section class="content">
			<div class="container-fluid">
				<div class="row">
					<div class="col-12">
						<div style="height: 50px">
							<div class="float-left">
								<div id="branchFilter">
									
									<!-- select 에서 체인지 이벤트 걸어주려고 id지정 -->
									<select name="ptmember" id="ptmember" style="margin-left: 30px">
										<option value="listAll">전체</option>
										<option value="member_name">이름</option>
										<option value="mem_no">회원번호</option>
										<c:if test="${sessionScope.loginEmp.position eq '대표' }">
										<option value="emp_name">트레이너</option>
										</c:if>
									</select>
									<input type="text" id="searchInput" name="searchInput" value="">
									<button id="searchButton" class="btn btn-outline-dark">검색</button>
								</div>
							</div>
							<div class="float-right">
								<c:if test="${sessionScope.loginEmp.position eq '트레이너' }">
									<button class="btn btn-primary" onclick="location.href='dailypt.go'">일지 등록</button>&nbsp;
									<button class="btn btn-danger" onclick="ptmemdel()">일지 삭제</button>
									
								</c:if>
							</div>
						</div>
						<div class="card card-primary">
							<div class="card-header">
								<h4 class="card-title">일지 리스트</h4>
							</div>
							<div class="card-body">
								<table class="table">
									<thead class="table-light">
										<tr>
											<th>이름</th>
											<th>회원번호</th>
											<th>운동일자</th>
											<th>트레이너</th>
											<th>출석여부</th>
											<th>삭제</th>
										</tr>
									</thead>
									<tbody id="ptlist"></tbody>
								</table>
							</div>
						</div>
					</div>
				</div>
			</div>
			<!--/. container-fluid -->
		</section>
	</div>
</body>
<script>
	/* function toggleAllCheckboxes() {
		const checkboxes = document.getElementsByClassName('rowCheckbox');
		const selectAllCheckbox = document.getElementById('selectAll');
		for (let i = 0; i < checkboxes.length; i++) {
			checkboxes[i].checked = selectAllCheckbox.checked;
		}
	}

	function deleteSelectedRows() {
		const checkboxes = document.getElementsByClassName('rowCheckbox');
		const deleteForm = document.getElementById('deleteForm');
		const dailyptNoInput = document.getElementById('dailypt_no');
		const dailyptNoInput = document.getElementById('mem_no');

		// 선택된 행의 dailypt_no 값을 배열로 저장
		const selectedRows = [];
		for (let i = 0; i < checkboxes.length; i++) {
			if (checkboxes[i].checked) {
				selectedRows.push(checkboxes[i].value);
			}
		}

		// 선택된 dailypt_no 값을 hidden input에 설정
		dailyptNoInput.value = selectedRows.join(',');

		// form을 제출하여 서버로 데이터 전송
		deleteForm.submit();
	}
 */
	
 
	$(document).ready(function() {
		// 페이지 로드 시 초기 데이터 호출
		ptlist();
	});

	function ptlist() {
		$.ajax({
			type: 'get',
			url: 'ptlist.ajax',
			dataType: 'json',
			success: function(data) {
				ptlistdraw(data.ptlist);
			},
			error: function(e) {
				console.log(e);
			}
		});
	}

	
	function ptlistdraw(ptlist) {
			
		var content = '';
			
			if(ptlist.length > 0){
			ptlist.forEach(function(dailypt,index){
				
			content += '<tr>';
			content += '<td><a href="dailyPtDetail.do?dailypt_no=' + dailypt.dailypt_no + '">' + dailypt.member_name + '</a></td>';
			content += '<td>' + dailypt.mem_no + '</td>';
			content += '<td>' + dailypt.pt_date + '</td>';
			content += '<td>' + dailypt.emp_name + '</td>';
			content += '<td>' + dailypt.pt_state + '</td>';
			content += '<td><input type="checkbox" value="'+ dailypt.dailypt_no +'"/></td>';
			content += '</tr>';
		});
			
		}else{
			content = "<tr><td colspan='7' style='text-align:center'>등록된 일지가 없습니다.</td></tr>"
		}
		
		$('#ptlist').empty();
		$('#ptlist').append(content);
	
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

	
	
	
	
	function ptmemdel(){
		
		var checkArr = [];
		
		$('input[type="checkbox"]:checked').each(function(idx,item){		
			//checkbox 에 value 를 지정하지 않으면 기본값을 on 으로 스스로 지정한다.
			if($(this).val()!='on'){
				//console.log(idx,$(this).val());
				checkArr.push($(this).val());
			}	
		});
		
		
		 if (checkArr.length === 0) {
		        alert('삭제할 일지를 선택해주세요.');
		        return;
		    }
		
		
		 // 삭제 여부를 묻는 알림창을 띄우기
	    var confirmed = confirm('선택한 회원 일지를 삭제하시겠습니까?');
	    if (!confirmed) {
	        return;
	    }

		
		console.log(checkArr);
			
		$.ajax({
			type:'get',
			url:'ptdailydel.ajax',
			data:{'dailypt': checkArr},
			dataType:'json',
			success:function(data){
				console.log(data);
				if(data.success){
					alert(data.msg);
					ptlist();
				}
			},
			error:function(e){
				console.log(e);
			}		
		});
		
		
	}		


	// 검색 버튼 클릭 시
	$('#searchButton').click(function() {
		listCall();
	});

	function listCall() {
		var ptmember = $('select[name="ptmember"]').val();
		var searchInput = $('input[name="searchInput"]').val();

		$.ajax({
			type: 'post',
			url: 'ptmemberSearch.ajax',
			data: {
				'ptmember': ptmember,
				'searchInput': searchInput
			},
			dataType: 'json',
			success: function(data) {
				ptlistdraw(data.ptlist);
				console.log(data);
			},
			error: function(e) {
				console.log(e);
			}
		});
	}
	
	
	
</script>
</html>