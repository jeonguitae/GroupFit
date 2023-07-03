<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
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
      <input type="number" name="weight[]" placeholder="무게">
      <input type="number" name="reps[]" placeholder="횟수">
      <input type="number" name="sets[]" placeholder="셋트 수">
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



</script>
</html>