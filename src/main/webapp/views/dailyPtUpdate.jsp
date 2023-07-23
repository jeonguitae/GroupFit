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
        align-items: center;
       
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
        flex: 1;
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
        background-color: transparent;
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
	display: flex;
    margin: 0 auto;
}

/* 버튼 컨테이너에 대한 스타일 */
.removeExerciseButton {
  display: flex;
   color: white; /* 글자 색상을 흰색으로 설정 */
  border: none; /* 버튼 테두리 제거 */
  cursor: pointer;
  align-items: center;
  background-color: transparent;
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

				</div>
			</div>
			<!-- /.container-fluid -->
		</section>
<!-- Main content -->
		<section class="content">
			<div class="container-fluid">
				
   
				    <div class="container">

				    <form id="dailyptForm" method="post">
				    	<input type="hidden" name="dailypt_no" value="${dto.dailypt_no}"/>
				    
					    <div class="card card-primary">
						    <div class="card-header">
						        <h4 class="card-title">${dto.member_name} 님의 일지</h4>
						    </div>
						</div>
					        
					        <div class="form-group">
					        <div class="mb-3">
							  <label for="date" class="form-label">날짜</label>
							  <input type="date" class="form-control" id="date" name="date" value="${dto.pt_date}">
							</div>
							</div>
					        
					    
					           
				            <hr>
				        
				            
				            
				            <div class="form-group">
							  <div class="row">
							    <div class="col">
							      <label for="memberNumber">회원 번호</label>
							      <input type="text" id="mem_no" name="mem_no" class="form-control" value="${dto.mem_no}" readonly>
							    </div>
							    <div class="col">
							      <label for="name">이름</label>
							      <input type="text" id="name" name="name" class="form-control" value="${dto.member_name}" readonly>
							    </div>
							    <div class="col">
							      <label for="weight">몸무게</label>
							      <input type="number" id="af_weight" name="af_weight" class="form-control" value="${dto.af_weight}">
							    </div>
							  </div>
							</div>
				            
				            
				
				            <hr>
				            

				             <h5 >웨이트 운동</h5>
				              <div id="weightExerciseContainer">
							       
							        <div class="form-group add-exercise-container">
						                <button type="button" class="btn btn-light add-exercise-button" id="addWeightExercise">운동 추가</button>
						          	</div>
						          	
						     
								    
								    
								    <div class="form-group">
							         	<input type="hidden" name="weight_no[]" value="${weightList[0].weight_no}"/>
							        <div class="row">
							          <div class="col-4">
							            <label for="weightExerciseName">운동명</label>
							            <input type="text" id="pt_name1" name="pt_name[]" class="form-control" value="${weightList[0].pt_name}">
							          </div>
							          
							          <div class="col-4">
							            <label for="setCount">무게</label>
							            <input type="number" id="pt_kg1" name="pt_kg[]" class="form-control" value="${weightList[0].pt_kg}">
							          </div>
							          
							          <div class="col-4">
							            <label for="repCount">SET수</label>
							            <input type="number" id="pt_set" name="pt_set[]" class="form-control" value="${weightList[0].pt_set}">
							          </div>
							          <!-- weight_no 값을 따로 전송 -->
    									<input type="hidden" name="weight_no_value[]" value="${weightList[0].weight_no}">
							        </div>
							      </div>
								    
								    
								    
													           
						           <!-- 추가된 운동 정보를 가져와서 폼을 생성 -->
								      
								    
								    
								    <c:forEach var="weight" items="${weightList}" begin="1" varStatus="loop">
								    
								    <div class="form-group">
							        <div class="row">
							          <div class="col-4">
							            <label for="weightExerciseName">운동명</label>
							            <input type="text" id="pt_name${loop.index + 1}" name="pt_name[]" class="form-control" value="${weight.pt_name}">
							          </div>
							          
							          <div class="col-4">
							            <label for="setCount">무게</label>
							            <input type="number" id="pt_kg${loop.index + 1}" name="pt_kg[]" class="form-control" value="${weight.pt_kg}">
							          </div>
							          
							          <div class="col-4">
							            <label for="repCount">SET수</label>
							            <input type="number" id="pt_set${loop.index + 1}" name="pt_set[]" class="form-control" value="${weight.pt_set}">
							          </div>
							          <!-- weight_no 값을 따로 전송 -->
        							<input type="hidden" name="weight_no_value[]" value="${weight.weight_no}">
							          
							        </div>
							          <button type="button" class="removeExerciseButton">x</button>
							      </div>
								   </c:forEach>
								    
								    
						    </div>
						    
						    
						    								
				            <hr>
				
				           <!-- 유산소 운동 -->
               
                    
                    <div class="form-group">
                    <div class="mb-3">
					  <label for="formGroupExampleInput" class="form-label">유산소 운동</label>
					  <textarea id="aerobic" name="aerobic" class="form-control">${dto.aerobic}<</textarea>
					</div>
                    </div>
                    
                    
                    

                    <hr>

                    <!-- 식단 일지 -->
          
                    <div class="form-group">
                     <div class="mb-3">
					  <label for="formGroupExampleInput" class="form-label">식단 일지</label>
					  <textarea id="diet" name="diet" class="form-control">${dto.diet}</textarea>
					</div>
					</div>
                    
                    
                    

                    <hr>

                    <!-- 특이 사항 -->
          
                    
                    <div class="form-group">
                    <div class="mb-3">
					  <label for="formGroupExampleInput" class="form-label">특이 사항</label>
					  <textarea id="etc" name="etc" class="form-control">${dto.str}</textarea>
					</div>
					</div>
                  

                    <hr>
                    
					<div class="submit-button">
	                    <button type="submit" id="updatedailypt" formaction="/dailyptUpdate.do" class="btn btn-primary" >수정하기</button>

	                    <button type="button" id="updatelist" class="btn btn-primary" onclick="confirmAndNavigateToList()" >리스트</button>
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
function addWeightExercise() {
	  var container = document.getElementById('weightExerciseContainer');
	  var newExercise = document.createElement('div');
	  newExercise.classList.add('form-group');
	  newExercise.innerHTML = `
		  <div class="row">
	      <div class="col-4">
	        <label for="pt_name">운동명 : </label>
	        <input type="text" name="pt_name[]" class="form-control">
	      </div>
	      <div class="col-4">
	        <label for="pt_kg">무게 : </label>
	        <input type="number" name="pt_kg[]" class="form-control">
	      </div>
	      <div class="col-4">
	        <label for="pt_set">SET 수 : </label>
	        <input type="number" name="pt_set[]" class="form-control"> 
	      </div>
	    </div>
	      <button type="button" class="removeExerciseButton">x</button>
	  `;
	  container.appendChild(newExercise);

  // 새로운 삭제 버튼에 이벤트 핸들러 등록
  var removeButton = newExercise.querySelector('.removeExerciseButton');
  removeButton.addEventListener('click', function() {
    var exerciseContainer = this.parentNode;
    exerciseContainer.remove();
  });
}

document.getElementById('addWeightExercise').addEventListener('click', function() {
  addWeightExercise();
});

// 삭제 버튼 클릭 이벤트 처리
function registerRemoveButtonEvent() {
  var removeButtons = document.getElementsByClassName('removeExerciseButton');
  for (var i = 0; i < removeButtons.length; i++) {
    removeButtons[i].addEventListener('click', function() {
      var exerciseContainer = this.parentNode;
      exerciseContainer.remove();
    });
  }
}

// 초기 로드 시 기존 삭제 버튼에 이벤트 핸들러 등록
registerRemoveButtonEvent();




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
	    if (input.id !== 'name' && input.id !== 'mem_no') {
	      input.value = '';
	    }
	    input.readOnly = true;
	  });

	  formTextarea.forEach(function(textarea) {
	    textarea.value = '';
	    textarea.readOnly = true;
	  });
	}




document.getElementById('updatedailypt').addEventListener('click', function(event) {
	  event.preventDefault(); // 폼 제출 방지

	// 필드 값 가져오기
    var nameInput = document.getElementById('name');
    var memNoInput = document.getElementById('mem_no');
    var dateInput = document.getElementById('date');
    var ptNameInputs = document.querySelectorAll('input[name="pt_name[]"]');
    var ptKgInputs = document.querySelectorAll('input[name="pt_kg[]"]');
    var ptSetInputs = document.querySelectorAll('input[name="pt_set[]"]');
    var aerobicTextarea = document.getElementById('aerobic');
    var dietTextarea = document.getElementById('diet');
    var etcTextarea = document.getElementById('etc');

	  

 // 필수 입력 사항과 웨이트 운동 필드 체크
    for (var i = 0; i < ptNameInputs.length; i++) {
        if (nameInput.value.trim() === '' || memNoInput.value.trim() === '' || dateInput.value.trim() === '' || ptNameInputs[i].value.trim() === '' || ptKgInputs[i].value.trim() === '' || ptSetInputs[i].value.trim() === '' || aerobicTextarea.value.trim() === '' || dietTextarea.value.trim() === '' || etcTextarea.value.trim() === '') {
            alert('모든 항목은 필수 입력 사항입니다.');
            return; // 함수 종료
        }
    }

	  if (confirm('일지 수정 하시겠습니까?')) {
	    // 추가로 필요한 로직 수행

	    // '/submitcut' URL로 이동
	    document.getElementById('dailyptForm').setAttribute('action', '/dailyptUpdate.do');
	    document.getElementById('dailyptForm').submit();
	  } else {
	    // 확인을 누르지 않은 경우에는 아무 작업도 수행하지 않습니다.
	    return; // 함수 종료
	  }
	});

 
 
function confirmAndNavigateToList() {
	  if (confirm('리스트 페이지로 이동하시겠습니까?')) {
	    location.href = './dailyptt';
	  }
	}



</script>
</html>