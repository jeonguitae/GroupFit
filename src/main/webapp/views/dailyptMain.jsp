<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>pt 회원 일지</title>
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
			
			
				<table class="table">
				  <thead>
				    <tr>
				      <th>No</th>
				      <th>이름</th>
				      <th>회원번호</th>
				      <th>운동일자</th>
				      <th>트레이너</th>
				      <th><input type="checkbox" id="selectAll" onclick="toggleAllCheckboxes()"></th>
				    </tr>
				  </thead>
				  <tbody>
				    <c:forEach items="${list}" var="member">
				      <tr>
				        <td>${member.no}</td>
				        <td>${member.name}</td>
				        <td>${member.memberNumber}</td>
				        <td>${member.exerciseDate}</td>
				        <td>${member.trainer}</td>
				        <td><input type="checkbox" class="rowCheckbox" name="deleteRow[]" value="${member.no}"></td>
				      </tr>
				    </c:forEach>
				    <c:if test="${empty list}">
				      <tr class="empty-data">
				        <td colspan="6">데이터가 없습니다.</td>
				      </tr>
				    </c:if>
				  </tbody>
				</table>
							</div>
							<!--/. container-fluid -->
						</section>
					</div>
				</body>
<script>
function toggleAllCheckboxes() {
	  const checkboxes = document.getElementsByClassName('rowCheckbox');
	  const selectAllCheckbox = document.getElementById('selectAll');
	  for (let i = 0; i < checkboxes.length; i++) {
	    checkboxes[i].checked = selectAllCheckbox.checked;
	  }
	}

	function deleteSelectedRows() {
	  const checkboxes = document.getElementsByClassName('rowCheckbox');
	  const selectedRows = [];
	  for (let i = 0; i < checkboxes.length; i++) {
	    if (checkboxes[i].checked) {
	      selectedRows.push(checkboxes[i].value);
	    }
	  }
	  // 선택된 행 삭제 처리를 수행하는 로직을 추가하세요.
	  // 서버로 선택된 행을 전송하여 삭제 작업을 수행하거나, 클라이언트 측에서 동적으로 행을 제거할 수 있습니다.
	}
</script>
</html>





<%-- <%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700&display=fallback">
<link rel="stylesheet" href="plugins/fontawesome-free/css/all.min.css">
<link rel="stylesheet" href="plugins/overlayScrollbars/css/OverlayScrollbars.min.css">
<link rel="stylesheet" href="dist/css/adminlte.min.css">

</head>
<style>
.modal {
  display: none;
  position: fixed;
  z-index: 1;
  left: 0;
  top: 0;
  width: 100%;
  height: 100%;
  overflow: auto;
  background-color: rgba(0, 0, 0, 0.4);
}

.modal-content {
  background-color: #fefefe;
  margin: 15% auto;
  padding: 20px;
  border: 1px solid #888;
  width: 300px;
}

.close {
  color: #aaa;
  float: right;
  font-size: 28px;
  font-weight: bold;
}

.close:hover,
.close:focus {
  color: black;
  text-decoration: none;
  cursor: pointer;
}
</style>
<body>

   <form action="insertMemberRecord" method="POST">
   
    <input type="checkbox" id="absentCheckbox" onchange="toggleInputs()" />
    <label for="absentCheckbox">결석</label>
   
   <hr>
   
  <fieldset>
    <legend>회원 정보</legend>
    

    <label for="exerciseDate">운동일자:</label>
    <input type="date" id="exerciseDate" name="exerciseDate" required>
        
    <label for="memberNumber">회원번호:</label>
    <input type="text" id="memberNumber" name="memberNumber" placeholder="회원번호" required>
        
    <label for="memberName">회원이름:</label>
    <input type="text" id="memberName" name="memberName" placeholder="회원이름" required>
        
    <label for="weight">몸무게:</label>
    <input type="number" id="weight" name="weight" placeholder="몸무게" required>
  </fieldset>

  <hr>

  <fieldset>
    <legend>웨이트 운동</legend>

    <div id="weightExerciseForm">
      <input type="text" name="exerciseName[]" placeholder="운동명">
      <input type="number" name="weight[]" placeholder="무게(kg)">
      <input type="number" name="reps[]" placeholder="횟수(회)">
      <input type="number" name="sets[]" placeholder="셋트 수(SET)">
    </div>

    <button type="button" onclick="openModal()">운동 추가</button>
  </fieldset>

  <hr>

  <fieldset>
    <legend>유산소 운동</legend>

    <label for="cardioExercise">유산소 운동:</label>
    <div>
      <input type="text" id="cardioExercise" name="cardioExercise" placeholder="유산소 운동명">
    </div>
  </fieldset>
  
   <hr>

  <fieldset>
    <legend>식단 일지</legend>

    <label for="food">식단 일지:</label>
    <div>
      <input type="text" id="food" name="food" placeholder="식단 일지">
    </div>
  </fieldset>
  
   <hr>

  <fieldset>
    <legend>특이사항</legend>

    <label for="etc">특이사항:</label>
    <div>
      <input type="text" id="etc" name="etc" placeholder="특이사항">
    </div>
  </fieldset>

  <!-- 모달 창 -->
  <div id="modal" class="modal">
    <div class="modal-content">
      <span class="close" onclick="closeModal()">&times;</span>
      <input type="text" id="exerciseNameModal" placeholder="운동명">
      <input type="number" id="weightModal" placeholder="무게">
      <input type="number" id="repsModal" placeholder="횟수">
      <input type="number" id="setsModal" placeholder="셋트 수">
      <button type="button" onclick="addWeightExercise()">추가</button>
    </div>
  </div>
  
   <hr>

  <button type="submit">등록</button>
</form>
    
</body>
<script>
//모달 창 열기
function openModal() {
  var modal = document.getElementById("modal");
  modal.style.display = "block";
}

// 모달 창 닫기
function closeModal() {
  var modal = document.getElementById("modal");
  modal.style.display = "none";
}

// 웨이트 운동 폼에 운동 추가
function addWeightExercise() {
  var exerciseName = document.getElementById("exerciseNameModal").value;
  var weight = document.getElementById("weightModal").value;
  var reps = document.getElementById("repsModal").value;
  var sets = document.getElementById("setsModal").value;
  
  var weightExerciseForm = document.getElementById("weightExerciseForm");
  var exerciseDiv = document.createElement("div");
  exerciseDiv.innerHTML =
    '<input type="text" name="exerciseName[]" value="' +
    exerciseName +
    '">' +
    '<input type="number" name="weight[]" value="' +
    weight +
    '">' +
    '<input type="number" name="reps[]" value="' +
    reps +
    '">' +
    '<input type="number" name="sets[]" value="' +
    sets +
    '">';
  weightExerciseForm.appendChild(exerciseDiv);
  
  closeModal();
}


function toggleInputs() {
    var inputs = document.getElementsByTagName("input");
    for (var i = 0; i < inputs.length; i++) {
      if (inputs[i].type !== "checkbox" && inputs[i].type !== "submit") {
        inputs[i].disabled = document.getElementById("absentCheckbox").checked;
      }
    }
  }



</script>
</html> --%>