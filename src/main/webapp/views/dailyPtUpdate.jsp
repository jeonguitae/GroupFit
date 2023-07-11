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
<style>
  .form-group {
        display: flex;
        flex-direction: row;
        align-items: center;
        margin-bottom: 10px;
    }

    .form-group label {
        flex: 1;
        white-space: nowrap;
        margin-right: 10px;
    }

    .form-group input[type="text"],
    .form-group input[type="number"],
    .form-group input[type="date"],
    .form-group textarea {
        flex: 2;
        background-color: transparent;
        border: 1px solid white;
        color: white; /* 글자 색상을 하얀색(흰색)으로 설정 */
    }

    .add-exercise-container {
        flex: 1;
        display: flex;
        justify-content: flex-end;
        align-items: center;
    }

    .add-exercise-button {
        margin-left: 10px;
        margin-right: 0;
    }

    .aerobic-exercise,
    .diet-journal,
    .remarks {
        width: 100%;
        min-height: 150px;
        background-color: transparent; /* 투명 배경색 */
        border: 1px solid white; /* 테두리 스타일 유지 */
        color: white; /* 글자 색상을 하얀색(흰색)으로 설정 */
    }
    
    .container {
        max-width: 800px;
        margin: 0 auto;
    }
    
    
	.aerobic-exercise,
	.diet-journal,
	.remarks {
	    width: 100%;
	    min-height: 200px;
	    max-height: 300px;
	    overflow-y: auto;
	    background-color: transparent;
	    border: 1px solid white;
	    color: white;
	    resize: none;
	}
	
	.submit-button {
    display: flex;
    justify-content: center;
    margin-top: 20px;
}

.submit-button button {
    margin: 0 auto;
}
</style>
</head>
<body>
	<jsp:include page="GroupFit_gnb.jsp" />
	<div class="content-wrapper" style="margin-top: 57.08px">
		<section class="content-header">
			<div class="container-fluid">
				<div class="row mb-2">
					<div class="col-sm-6">
						<h1></h1>
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
				
   
				    <div class="container">

				    <form action="dailyptUpdate.do" method="post">
				    	<input type="hidden" name="dailypt_no" value="${dto.dailypt_no}"/>
				    
					    <div style="display: flex; justify-content: space-between; align-items: center;">
					        <h3 style="margin: 0;">회원pt일지</h3>
					        
					        <br>
					        
					         <div style="display: flex; align-items: center; margin-left: 50px;">
				                <input type="checkbox" id="absentCheckbox" name="absentCheckbox">
				                <label for="absentCheckbox">결석</label>
				            </div>
					        
					        <div class="form-group" style="margin-bottom: 0; display: flex; align-items: center;">
					            <label for="date">날짜 : </label>
					            <input type="date" id="date" name="date" value="${dto.pt_date}">
					        </div>
					        
					    </div>
					           
				            <hr>
				            <!-- 회원 정보 -->
				            <div class="form-group">

				                <label for="memberNumber">회원 번호 : </label>
				                <input type="text" id="mem_no" name="mem_no" value="${dto.mem_no}">
				                
				                <label for="name">이름 : </label>
				                <input type="text" id="name" name="name" value="${dto.member_name}">
				                
				                <label for="weight">몸무게 : </label>
				                <input type="number" id="af_weight" name="af_weight" value="${dto.af_weight}">
				            </div>
				
				            <hr>
				            

				             <h5 >웨이트 운동</h5>
				              <div id="weightExerciseContainer">
							       
							        <div class="form-group add-exercise-container">
						                <button type="button" class="btn btn-primary add-exercise-button" id="addWeightExercise">운동 추가</button>
						          	</div>
						          	
						          <div class="form-group">
						          	<input type="hidden" name="weight_no[]" value="${weightList[0].weight_no}"/>

								        <label for="weightExerciseName">운동명 : </label>
								        <input type="text" id="pt_name1" name="pt_name[]" value="${weightList[0].pt_name}">

								        <label for="setCount">무게 : </label>
								        <input type="number" id="pt_kg1" name="pt_kg[]" value="${weightList[0].pt_kg}">

								        <label for="repCount">SET수 : </label>
								        <input type="number" id="pt_set1" name="pt_set[]" value="${weightList[0].pt_set}">
								   		
								   		<!-- weight_no 값을 따로 전송 -->
    									<input type="hidden" name="weight_no_value[]" value="${weightList[0].weight_no}">
								    </div>
													           
						           <!-- 추가된 운동 정보를 가져와서 폼을 생성 -->
								      <c:forEach var="weight" items="${weightList}" begin="1" varStatus="loop">
								 
								        <div class="form-group">
								        	<input type="hidden" name="weight_no[]" value="${weight.weight_no}"/>
								            <label for="weightExerciseName">운동명 : </label>
								            <input type="text" id="pt_name${loop.index + 1}" name="pt_name[]" value="${weight.pt_name}">
								   
								            <label for="setCount">무게 : </label>
								            <input type="number" id="pt_kg${loop.index + 1}" name="pt_kg[]" value="${weight.pt_kg}">

								            <label for="repCount">SET수 : </label>
								            <input type="number" id="pt_set${loop.index + 1}" name="pt_set[]" value="${weight.pt_set}">
								        	<!-- weight_no 값을 따로 전송 -->
        									<input type="hidden" name="weight_no_value[]" value="${weight.weight_no}">
    	
								        </div>
								    </c:forEach>
						    </div>
						    
						    
						    								
				            <hr>
				
				           <!-- 유산소 운동 -->
                    <h5>유산소 운동</h5>
                    <br>
                    <div class="form-group">
                        <textarea id="aerobic" name="aerobic" class="aerobic-exercise">${dto.aerobic}</textarea>
                    </div>

                    <hr>

                    <!-- 식단 일지 -->
                    <h5>식단 일지</h5>
                    <br>
                    <div class="form-group">
                        
                        <textarea id="diet" name="diet" class="diet-journal">${dto.diet}</textarea>
                    </div>

                    <hr>

                    <!-- 특이 사항 -->
                    <h5>특이 사항</h5>
                    <br>
                    <div class="form-group">
                        <textarea id="etc" name="etc" class="remarks">${dto.str}</textarea>
                    </div>

                    <hr>
                    
					<div class="submit-button">
	                    <button type="submit" class="btn btn-primary" >수정하기</button>
	                    <button type="submit" class="btn btn-primary" onclick="location.href='./dailyptt'" >리스트</button>
	                </div>
	                
				    <br>
				
				        </form>
				    </div>
				
				
							</div>
							<!--/. container-fluid -->
						</section>
					</div>
				</body>
<script>
//웨이트 운동 추가 버튼 클릭 이벤트 처리
function addWeightExercise() {
    var container = document.getElementById('weightExerciseContainer');
    var index = container.getElementsByClassName('form-group').length + 1;

    var newExercise = document.createElement('div');
    newExercise.classList.add('form-group');
    newExercise.innerHTML = `
        <label for="pt_name${index}">운동명:</label>
        <input type="text" id="pt_name${index}" name="pt_name[]" value="">
        <label for="pt_kg${index}">무게:</label>
        <input type="number" id="pt_kg${index}" name="pt_kg[]" value="">
        <label for="pt_set${index}">SET 수:</label>
        <input type="number" id="pt_set${index}" name="pt_set[]" value="">
    `;

    container.appendChild(newExercise);
}

document.getElementById('addWeightExercise').addEventListener('click', function() {
    addWeightExercise();
});






// 결석 체크박스 상태에 따라 입력 제한 설정
var absentCheckbox = document.getElementById('absentCheckbox');
var formInputs = document.querySelectorAll('form input:not(#absentCheckbox)');
var formTextarea = document.querySelectorAll('form textarea');

absentCheckbox.addEventListener('change', function() {
    if (this.checked) {
        disableInputs();
    } else {
        enableInputs();
    }
});



//이름 선택 시 해당 이름과 회원번호를 필드에 입력하고 readonly 속성을 설정하는 함수
function selectName() {
  var selectElement = document.getElementById("daily_pt");
  var selectedName = selectElement.options[selectElement.selectedIndex].text;
  var selectedMemNo = selectElement.value;

  document.getElementById("name").value = selectedName;
  document.getElementById("mem_no").value = selectedMemNo;
  document.getElementById("name").readOnly = true;
  document.getElementById("mem_no").readOnly = true;
}



function disableInputs() {
    formInputs.forEach(function(input) {
        input.disabled = true;
    });

    formTextarea.forEach(function(textarea) {
        textarea.disabled = true;
    });
}

function enableInputs() {
    formInputs.forEach(function(input) {
        input.disabled = false;
    });

    formTextarea.forEach(function(textarea) {
        textarea.disabled = false;
    });
}






</script>
</html>