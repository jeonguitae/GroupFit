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
					
				</div>
			</div>
			<!-- /.container-fluid -->
		</section>
<!-- Main content -->
		<section class="content">
			<div class="container-fluid">
				
   
				    <div class="container">
						
						<div class="card card-primary">
						    <div class="card-header">
						        <h4 class="card-title">${dto.member_name} 님의 일지</h4>
						    </div>
						</div>
				    
					  <!--   <div style="justify-content: space-between; align-items: center;">
					        <h3 style="margin: 0;">회원pt일지 상세보기</h3>
 -->
					          

					        <div class="form-group">
					        <div class="mb-3">
							  <label for="date" class="form-label">날짜</label>
							  <input type="date" class="form-control" id="date" name="date" value="${dto.pt_date}" readonly>
							</div>
							</div>
							
					        
					   
					           
				            <hr>
				            <!-- 회원 정보 -->

				            
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
							      <input type="number" id="af_weight" name="af_weight" class="form-control" value="${dto.af_weight}" readonly>
							    </div>
							  </div>
							</div>
				            
				            
				            
				
				            <hr>
				            
				            
					         	 <c:if test="${dto.pt_state eq '결석'}">
								    <div style="border: 1px solid #ccc; padding: 10px; background-color: #f8f8f8; margin-bottom: 10px;">
								        <p style="color: red;">결석된 회원입니다.</p>
								    </div>
								</c:if>
								
				           
				           	<c:if test="${dto.pt_state ne '결석'}">
				              <h5 >웨이트 운동</h5>
				              
						    
				              <div id="weightExerciseContainer">
				              
				              
				              
				              <div class="form-group">
							        <div class="row">
							          <div class="col-4">
							            <label for="weightExerciseName">운동명</label>
							            <input type="text" id="pt_name" name="pt_name[]" class="form-control" value="${weightList[0].pt_name}" readonly>
							          </div>
							          <div class="col-4">
							            <label for="setCount">무게</label>
							            <input type="number" id="pt_kg" name="pt_kg[]" class="form-control" value="${weightList[0].pt_kg}" readonly>
							          </div>
							          <div class="col-4">
							            <label for="repCount">SET수</label>
							            <input type="number" id="pt_set" name="pt_set[]" class="form-control" value="${weightList[0].pt_set}" readonly>
							          </div>
							        </div>
							      </div>
							      
							      

								    
								    <c:forEach var="weight" items="${weightList}" begin="1" varStatus="loop">
								     <div class="form-group">
								        <div class="row">
								          <div class="col-4">
								            <label for="weightExerciseName">운동명</label>
								            <input type="text" id="pt_name${loop.index + 1}" name="pt_name[]" class="form-control" value="${weight.pt_name}" readonly>
								          </div>
								          <div class="col-4">
								            <label for="setCount">무게</label>
								            <input type="number" id="pt_kg${loop.index + 1}" name="pt_kg[]" class="form-control" value="${weight.pt_kg}" readonly>
								          </div>
								          <div class="col-4">
								            <label for="repCount">SET수</label>
								            <input type="number" id="pt_set${loop.index + 1}" name="pt_set[]" class="form-control" value="${weight.pt_set}" readonly>
								          </div>
								        </div>
								      </div>
								      </c:forEach>
								    
													           
						           <!-- 추가된 운동 정보를 가져와서 폼을 생성 -->
				
						    </div>
				
				            <hr>
				
				           <!-- 유산소 운동 -->
        
                    <div class="form-group">
                    <div class="mb-3">
					  <label for="formGroupExampleInput" class="form-label">유산소 운동</label>
					  <textarea id="aerobic" name="aerobic" class="form-control" readonly>${dto.aerobic}</textarea>
					</div>
                    </div>

                    <hr>

                    <!-- 식단 일지 -->
         
                    
                     <div class="form-group">
                     <div class="mb-3">
					  <label for="formGroupExampleInput" class="form-label">식단 일지</label>
					  <textarea id="diet" name="diet" class="form-control" readonly>${dto.diet}</textarea>
					</div>
					</div>

                    <hr>

                    <!-- 특이 사항 -->
    
                    
                    <div class="form-group">
                    <div class="mb-3">
					  <label for="formGroupExampleInput" class="form-label">특이 사항</label>
					  <textarea id="etc" name="etc" class="form-control" readonly>${dto.str}</textarea>
					</div>
					</div>
                    
                    
                    
                    </c:if>

                    <hr>
                    
					<div class="submit-button">
					<c:if test="${sessionScope.loginEmp.position eq '트레이너' }">
					<c:if test="${dto.pt_state ne '결석'}">
	                    <button type="submit"  class="btn btn-primary" onclick="location.href='./dailyptUpdate.go?dailypt_no=${dto.dailypt_no}'">수정</button>
	                </c:if>
	                    <button id="deleteButton" type="button" class="btn btn-danger">삭제</button>
	                </c:if>
	                    <button type="submit" class="btn btn-primary" onclick="confirmAndNavigateToList()" >리스트</button>
	                </div>
	                
				    <br>
				
				    </div>
				
				
							</div>
							<!--/. container-fluid -->
						</section>
					</div>
				</body>
<script>
document.getElementById('deleteButton').addEventListener('click', function() {
	  if (confirm("정말로 삭제하시겠습니까?")) {
	    var form = document.createElement('form');
	    form.action = '/dailyptdelete.do';
	    form.method = 'post';

	    var dailyptNoInput = document.createElement('input');
	    dailyptNoInput.type = 'hidden';
	    dailyptNoInput.name = 'dailypt_no';
	    dailyptNoInput.value = '${dto.dailypt_no}';
	    form.appendChild(dailyptNoInput);

	    var memNoInput = document.createElement('input');
	    memNoInput.type = 'hidden';
	    memNoInput.name = 'mem_no';
	    memNoInput.value = '${dto.mem_no}';
	    form.appendChild(memNoInput);

	    document.body.appendChild(form);
	    form.submit();
	  }
	});



function confirmAndNavigateToList() {
	  if (confirm('리스트 페이지로 이동하시겠습니까?')) {
	    location.href = './dailyptt';
	  }
	}


</script>
</html>