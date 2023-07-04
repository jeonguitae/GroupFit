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
    }
    
    .container {
        max-width: 800px;
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
				    
				    <form action="submit.php" method="post">
					    <div style="display: flex; justify-content: space-between; align-items: center;">
					        <h3 style="margin: 0;">회원pt일지</h3>
					        
					        <div class="form-group" style="margin-bottom: 0; display: flex; align-items: center;">
					            <label for="date">날짜:</label>
					            <input type="date" id="date" name="date">
					        </div>
					        
					    </div>
					           
				            <hr>
				            <!-- 회원 정보 -->
				            <div class="form-group">

				                <label for="memberNumber">회원 번호:</label>
				                <input type="text" id="memberNumber" name="memberNumber">
				                
				                <label for="name">이름:</label>
				                <input type="text" id="name" name="name">
				                
				                <label for="weight">몸무게:</label>
				                <input type="number" id="weight" name="weight">
				            </div>
				
				            <hr>
				
				             <h5>웨이트 운동</h5>
						        <div id="weightExerciseContainer">
							          <div class="form-group add-exercise-container">
						                <button type="button" class="btn btn-primary add-exercise-button" id="addWeightExercise">운동 추가</button>
						            </div>
						            <div class="form-group">
						                <label for="weightExerciseName">운동명:</label>
						                <input type="text" id="weightExerciseName" name="weightExerciseName[]">
						                <label for="setCount">세트 수:</label>
						                <input type="number" id="setCount" name="setCount[]">
						                <label for="repCount">반복 횟수:</label>
						                <input type="number" id="repCount" name="repCount[]">
						            </div>
						
						        </div>
				
				            <hr>
				
				            <!-- 유산소 운동 -->
				            <h5>유산소 운동</h5>
				            <div class="form-group">
				                <label for="aerobicExercise">운동 내용:</label>
				                <textarea id="aerobicExercise" name="aerobicExercise" class="aerobic-exercise"></textarea>
				            </div>
				
				            <hr>
				
				            <!-- 식단 일지 -->
				            <h5>식단 일지</h5>
				            <div class="form-group">
				                <label for="dietJournal">식단 내용:</label>
				                <textarea id="dietJournal" name="dietJournal" class="diet-journal"></textarea>
				            </div>
				
				            <hr>
				
				            <!-- 특이 사항 -->
				            <h5>특이 사항</h5>
				            <div class="form-group">
				                <label for="remarks">내용:</label>
				                <textarea id="remarks" name="remarks" class="remarks"></textarea>
				            </div>
				            
				            <hr>
				
				            <button type="submit" class="btn btn-primary">등록</button>
				            
				            <br>
				
				        </form>
				    </div>
				
				
							</div>
							<!--/. container-fluid -->
						</section>
					</div>
				</body>
<script>
// 웨이트 운동 추가 버튼 클릭 이벤트 처리
document.getElementById('addWeightExercise').addEventListener('click', function() {
    var container = document.getElementById('weightExerciseContainer');
    var newExercise = document.createElement('div');
    newExercise.classList.add('form-group');
    newExercise.innerHTML = `
        <label for="weightExerciseName">운동명:</label>
        <input type="text" id="weightExerciseName" name="weightExerciseName[]">
        <label for="setCount">세트 수:</label>
        <input type="number" id="setCount" name="setCount[]">
        <label for="repCount">반복 횟수:</label>
        <input type="number" id="repCount" name="repCount[]">
    `;
    container.appendChild(newExercise);
});

</script>
</html>