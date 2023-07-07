<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>자료실</title>


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
						<h1>자료실</h1>
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
			<button onclick="location.href='referenceWrite.go'">글쓰기</button>
			<button>삭제</button>
				<table class="table table-bordered table-hover dataTable dtr-inline">
			<thead>
				<tr>
			 		<th>no</th>
			 		<th>제목</th>
			 		<th>작성자</th>
			 		<th>작성일자</th>
					<td><input type="checkbox" id="cbx_chkAll"/></td>
				</tr>
			</thead>
			<tbody>
				<c:if test="${list.size() == 0}">
					<tr><th colspan="5">게시글이 없습니다.</th></tr>
				</c:if>
				<c:forEach items="${list}" var="reference">
					<tr>
						<td>${reference.r_idx}</td>
						<td><a href="referenceDetail.do?idx=${reference.r_idx}">${reference.subject}</a></td>
						<td>${reference.name}</td>
						<td>${reference.date}</td>
						<td><input type="checkbox" name="chk"/></td>
					</tr>			
				</c:forEach>
			</tbody>
		</table>
			</div>
			<!--/. container-fluid -->
		</section>
	</div>
</body>
<script type="text/javascript">

$(document).ready(function() {
	  $("#cbx_chkAll").click(function() {
	    var isChecked = $(this).is(":checked");
	    $("input[name=chk]").prop("checked", isChecked);
	    if (isChecked) {
	      getSelectedIndexes();
	    }
	  });

	  $("input[name=chk]").click(function() {
	    if ($(this).is(":checked")) {
	      getSelectedIndexes();
	    }
	  });

	  function getSelectedIndexes() {
	    var selectedIndexes = [];
	    $("input[name=chk]:checked").each(function() {
	      if ($(this).attr("id") !== "cbx_chkAll") {
	        var index = $("input[name=chk]").index(this);
	        selectedIndexes.push(index);
	      }
	    });
	    console.log("선택된 체크박스의 인덱스: " + selectedIndexes);
	  }
	});
	
function sendIndexesToController(indexes) {
    $.ajax({
      url: "checkDeleteAjax.do",
      type: "POST",
      data: { indexes: indexes },
      success: function(response) {
        // 요청 성공 시 수행할 동작
        console.log("인덱스 전송이 완료되었습니다.");
        
      },
      error: function(xhr, status, error) {
        // 요청 실패 시 수행할 동작
        console.error("인덱스 전송 중 오류가 발생했습니다.");
      }
    });
  }
</script>
</html>



