<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset='utf-8' />
  <title>calendar</title>
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
  <link href='/packages/core/main.css' rel='stylesheet' />
  <link href='/packages/daygrid/main.css' rel='stylesheet' />
  <link href='https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css' rel='stylesheet'><!-- Bootstrap CSS 추가 -->
  <link href='/packages/list/main.css' rel='stylesheet' />
  <link href='/packages/timegrid/main.css' rel='stylesheet' />
  <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
  <script src='/packages/core/main.js'></script>
  <script src='/packages/interaction/main.js'></script>
  <script src='/packages/daygrid/main.js'></script>
  <script src='https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js'></script><!-- Bootstrap JavaScript 추가 -->
  <script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.29.1/moment.min.js"></script>
  <script src='/packages/list/main.js'></script>
  <script src='/packages/timegrid/main.js'></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.29.1/moment.min.js"></script>
  <style>
    body {
	  margin: 40px 10px;
	  padding: 0;
	  font-family: Arial, Helvetica Neue, Helvetica, sans-serif;
	  font-size: 14px;
	}
	.fc-day-header {
	  color: black;
	}

    #calendar {
      max-width: 900px;
      margin: 0 auto;
    }
/* 
    .fixed-top-button {
      position: fixed;
      top: 10px;
      left: 50%;
      transform: translateX(-50%);
    } */
    .fc-event {
      cursor: pointer;
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
						<h1>일정 관리</h1>
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
			
		
			
			<!-- 필터링이요 -->
			
			<div id="branchFilter">
				<c:if test="${sessionScope.loginEmp.position eq '대표' }">
					  <select name="branch" id="branch" style = "margin-left : 30px">
					  	<option value="listAll">전체</option>
			            <c:forEach items="${branchList}" var="item">
			               <option value="${item.b_idx}">${item.b_name}</option>
			            </c:forEach>
			           </select>
			    </c:if>
			</div>
			
			
			<div class="float-right">
			<c:if test="${sessionScope.loginEmp.position eq '트레이너' }">
				  <button class="btn btn-primary" onclick="openModal()">일정 등록</button>
			</c:if>
			</div>
			
			</div>
			
			<div class="card card-primary">
							<div class="card-header">
								<h4 class="card-title">이번 달 일정</h4>
							</div>
				  <!-- <button onclick="ck()">이벤트 확인</button> -->
				
				  <div id='calendar'></div>
				
				  <!-- 등록 버튼 모달 창 -->
				  <div class="modal fade" id="event-modal" tabindex="-1" role="dialog" aria-labelledby="event-modal-label">
				    <div class="modal-dialog" role="document">
				      <div class="modal-content">
				        <div class="modal-header">
				          	<h5 class="modal-title" id="event-modal-label">일정 등록</h5>
				          <button type="button" class="close" data-dismiss="modal" aria-label="Close">
				            <span aria-hidden="true">&times;</span>
				          </button>
				        </div>
				        <div class="modal-body">
				          <!-- 일정 등록 폼 -->
				          <form id="event-form">
				            <div class="form-group">
				              <label for="event-name">회원 이름</label>
				              <input type="text" class="form-control" id="event_name" name="event_name" placeholder="이름을 입력하세요">
				            </div>
				
				            <!-- 시작 시간 입력 필드 -->
				            <div class="form-group">
				              <label for="start-datetime">시작 시간</label>
				              <input id="start_time" type="datetime-local" class="form-control" name="start_time">
				            </div>
				
				            <!-- 종료 시간 입력 필드 -->
				            <div class="form-group">
				              <label for="end-datetime">종료 시간</label>
				              <input id="end_time" type="datetime-local" class="form-control" name="end_time">
				            </div>
				          </form>
				        </div>
				        <div class="modal-footer">
				          <button type="button" class="btn btn-secondary" data-dismiss="modal">취소</button>
				          <button type="button" class="btn btn-primary" id="save-event-btn">저장</button>
				        </div>
				      </div>
				    </div>
				  </div>
				
				  <!-- 상세보기 모달 창 -->
				<div class="modal fade" id="event-detail-modal" tabindex="-1" role="dialog" aria-labelledby="event-detail-modal-label">
				  <div class="modal-dialog" role="document">
				    <div class="modal-content">
				      <div class="modal-header">
				        <h5 class="modal-title" id="event-detail-modal-label">일정 상세보기</h5>
				        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
				          <span aria-hidden="true">&times;</span>
				        </button>
				      </div>
				      <div class="modal-body">
				        <!-- 일정 상세 정보 -->
				        <div id="event-detail-info">
				          <div class="form-group">
				            <label for="event-detail-title">회원 이름</label>
				            <input type="text" class="form-control" id="event-detail-title" readonly>
				          </div>
				          <div class="form-group">
				            <label for="event-detail-start">시작 시간</label>
				            <input type="text" class="form-control" id="event-detail-start" readonly>
				          </div>
				          <div class="form-group">
				            <label for="event-detail-end">종료 시간</label>
				            <input type="text" class="form-control" id="event-detail-end" readonly>
				          </div>
				        </div>
				      </div>
				      <div class="modal-footer">
				      
				      <c:if test="${sessionScope.loginEmp.position eq '트레이너' }">
				        <button type="button" class="btn btn-primary" id="edit-event-btn">수정</button>
				        <button type="button" class="btn btn-danger" id="delete-event-btn">삭제</button>
				      </c:if>
				      
				        <button type="button" class="btn btn-secondary" data-dismiss="modal">확인</button>
				      </div>
				    </div>
				  </div>
				</div>
				
				
				
				<!-- 수정 모달 -->
				<div id="edit-event-modal" class="modal" tabindex="-1">
				  <div class="modal-dialog">
				    <div class="modal-content">
				      <div class="modal-header">
				        <h5 class="modal-title">일정 수정하기</h5>
				        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
				          <span aria-hidden="true">&times;</span>
				        </button>
				      </div>
				      <div class="modal-body">
				        <!-- 수정 폼 -->
				        <form id="edit-event-form">
				          <!-- 수정할 이벤트 정보 입력 필드 -->
				          <div class="form-group">
				            <label for="edit-event-title">제목</label>
				            <input type="text" class="form-control" id="edit-event-title" placeholder="제목 입력">
				          </div>
				          <div class="form-group">
				            <label for="edit-event-start">시작 시간</label>
				            <input type="datetime-local" class="form-control" id="edit-event-start" placeholder="시작 시간 입력">
				          </div>
				          <div class="form-group">
				            <label for="edit-event-end">종료 시간</label>
				            <input type="datetime-local" class="form-control" id="edit-event-end" placeholder="종료 시간 입력">
				          </div>
				        </form>
				      </div>
				      <div class="modal-footer">
				        <button type="button" class="btn btn-secondary" id="cancel-edit-event-btn" data-dismiss="modal">취소</button>
				        <button type="button" class="btn btn-primary" id="submit-edit-event-btn">수정하기</button>
				      </div>
				    </div>
				  </div>
				</div>
				
				
				
				</div>
				
				</div>
				</div>
			
				
				
				
				
				  <script>
				    var calendar = null;
				    var emp_no = "${sessionScope.loginEmp.emp_no}";
				    var b_idx = "${sessionScope.loginEmp.b_idx}";
				    var position = "${sessionScope.loginEmp.position}";
				    
					// 상세보기랑 수정
				    $(document).ready(function() {
				    	  var calendarEl = document.getElementById('calendar');
				    	  var eventId; // eventId 변수를 상위 스코프에서 선언
				    	  var eventStart;
				    	  var eventEnd;
				    	  
				    	  calendar = new FullCalendar.Calendar(calendarEl, {
				    	    plugins: ['interaction', 'dayGrid'],
				    	    defaultDate: new Date(),
				    	    editable: false,
				    	    eventLimit: true,
				    	    events: [],
				    	    header: {
				    	        left: 'prev',
				    	        center: 'title',
				    	        right: 'today,next'
				    	      },
				    	    locale: 'ko',
				    	  

			         
				    	    
				    	    eventClick: function(info) {
				    	      // 클릭한 이벤트의 정보를 변수에 저장
				    	      eventId = info.event.id;
				    	      var eventTitle = info.event.title;
				    	      eventStart = info.event.start || new Date(); // 유효한 값을 가지도록 초기화, 같은 값을 가지면 null 값 들어가서 오류
				    	      eventEnd = info.event.end || new Date(); // 유효한 값을 가지도록 초기화

				    	      // 시간 형식 설정
				    	      // 상세보기에 시, 분 만 보이도록
				    	      var startTime = eventStart.toLocaleTimeString([], { hour: '2-digit', minute: '2-digit' });
				    	      var endTime = eventEnd.toLocaleTimeString([], { hour: '2-digit', minute: '2-digit' });

				    	      // 이벤트 정보를 상세보기 모달에 표시
				    	      $('#event-detail-title').val(eventTitle);
				    	      $('#event-detail-start').val(startTime);
				    	      $('#event-detail-end').val(endTime);

				    	      // 상세보기 모달을 엽니다.
				    	      $('#event-detail-modal').modal('show');

				    	      // 수정하기 버튼 클릭 시
				    	      $('#edit-event-btn').on('click', function() {
				    	    	  
					    		
				    	        // 수정 정보를 상세보기 모달에서 가져옵니다.
				    	        // title.val 은 변경한거 없으니까 그냥 가져오고
				    	        var editEventTitle = $('#event-detail-title').val();
				    	        //var editEventStart = $('#event-detail-start').val();
				    	        //var editEventEnd = $('#event-detail-end').val();

				    	        /* // 수정 모달에 정보를 설정합니다.
				    	        $('#edit-event-title').val(editEventTitle);
				    	        $('#edit-event-start').val(eventStart);
				    	        $('#edit-event-end').val(eventEnd); */
				    	     	// 기존 이벤트의 시작 시간과 종료 시간을 datetime-local 입력 필드에 설정합니다.
				    	     	
				    	     	// start는 캘린더에 맞게 변경하고
				    	        var startTime = eventStart.toISOString().slice(0, 16); // YYYY-MM-DDTHH:MM 형식으로 변환
				    	        var endTime = eventEnd.toISOString().slice(0, 16); // YYYY-MM-DDTHH:MM 형식으로 변환
				    	        $('#edit-event-start').val(startTime);
				    	        $('#edit-event-end').val(endTime);

				    	        // 수정 모달에 정보를 설정합니다.
				    	        $('#edit-event-title').val(editEventTitle);

				    	        // 상세보기 모달을 닫습니다.
				    	        $('#event-detail-modal').modal('hide');

				    	        // 수정 모달을 엽니다.
				    	        $('#edit-event-modal').modal('show');
				    	        
				    	     	// 수정하기 모달의 취소 버튼 클릭 시
				    	        $('#cancel-edit-event-btn, #edit-event-modal .close').on('click', function() {
				    	          // 수정 모달을 닫습니다.
				    	          $('#edit-event-modal').modal('hide');
				    	        });
				    	      });  
				    	    }
				    	  });

				    	  calendar.render();

				    	  // 모달 닫기 버튼 클릭 시
				    	  $(document).on('click', '#event-detail-modal .close, #event-detail-modal .modal-footer .btn-secondary', function() {
				    	    $('#event-detail-modal').modal('hide');
				    	  });

				    	  // 등록 모달 닫기 버튼 클릭 시
				    	  $(document).on('click', '#event-modal .close, #event-modal .modal-footer .btn-secondary', function() {
				    	    $('#event-modal').modal('hide');
				    	  });

				    	  // 수정하기 버튼 클릭 시
				    	  $('#submit-edit-event-btn').on('click', function() {
				    		  
				    		  // 확인 메시지를 띄웁니다.
				    		  var isConfirmed = confirm('일정을 수정하시겠습니까?');
				    		  
				    		  
				    		// 사용자가 확인 버튼을 눌렀을 경우에만 서버로 일정 수정 정보를 전송합니다.
				    		if (isConfirmed) {
				    	    // 수정 정보를 서버로 전송합니다.
				    	    $.ajax({
				    	      url: '/updatecalendar', // 수정 정보를 전송할 서버 엔드포인트 URL을 입력하세요.
				    	      method: 'POST',
				    	      data: {
				    	        id: eventId,
				    	        title: $('#edit-event-title').val(),
				    	        start: $('#edit-event-start').val(),
				    	        end: $('#edit-event-end').val(),
				    	        emp_no : emp_no,
				    	        b_idx : b_idx
				    	     
				    	      },
				    	      success: function(response) {
				    	        // 성공적으로 수정되었을 경우 수행할 동작을 추가하세요.
				    	        console.log('일정 수정 성공 ');
				    	        // 예: 모달 닫기, 캘린더 새로고침 등
				    	        // 수정 모달을 닫습니다.
				    	        $('#edit-event-modal').modal('hide');
				    	        location.reload();

				    	        
					    	      },
				    	      error: function(e) {
				    	        // 수정 실패 시 수행할 동작을 추가하세요.
				    	        console.error(e);
				    	        // 예: 오류 메시지 표시 등
				    	      }
				    	      
				    	    });
				    		  }
				    	    
				    	  });
				    	  
				    	  
				    	  
				    	  // 일정 삭제요
				    	  $(document).on('click', '#delete-event-btn', function() {
				    		  // 삭제할 이벤트의 ID를 가져옵니다.
				    		  //var eventId = eventId;
				    		  
				    		  // 확인 메시지를 띄웁니다.
				    		  var isConfirmed = confirm('일정을 삭제하시겠습니까?');
				    		 
							if(isConfirmed){
				    		  // 서버로 삭제 요청을 보냅니다.
				    		  $.ajax({
				    		    url: '/deletecalendar', // 삭제 요청을 전송할 서버 엔드포인트 URL을 입력하세요.
				    		    method: 'POST',
				    		    data: {
				    		      id: eventId
				    		    },
				    		    success: function(response) {
				    		      // 성공적으로 삭제되었을 경우 수행할 동작을 추가하세요.
				    		      console.log('일정 삭제 완료');
				    		      // 예: 모달 닫기, 캘린더 새로고침 등
				    		      // 삭제 모달을 닫습니다.
				    		      $('#delete-event-modal').modal('hide');
				    		      location.reload();
				    		    },
				    		    error: function(e) {
				    		      // 삭제 실패 시 수행할 동작을 추가하세요.
				    		      console.error(e);
				    		      // 예: 오류 메시지 표시 등
				    		    }
				    		  });
							}
				    		});
				    	});
				 

				    function openModal() {
				      $('#event-modal').modal('show');
				    }
				
				    // 콘솔에서 이벤트 확인
				    function ck() {
				      console.log(calendar.getEvents());
				      var events = calendar.getEvents();
				      events.forEach(function(event) {
				        console.log("Title:", event.title);
				        console.log("Start Time:", event.start);
				        console.log("End Time:", event.end);
				      });
				    }
				    
				    
				    
					// 일정 등록이요
				    // 저장 버튼 클릭 시 이벤트 처리
				    $(document).on('click', '#save-event-btn', function() {
				      // 데이터 추출
				      var eventName = $('#event_name').val();
				      var startDateTime = $('#start_time').val();
				      var endDateTime = $('#end_time').val();
				      console.log(eventName);
				
				      // 생성할 이벤트 데이터
				      var eventData = { 
				        title: eventName,
				        start: startDateTime,
				        end: endDateTime,
				        b_idx : b_idx,
				        emp_no : emp_no
				      };
				      console.log(eventData);
				
				      // AJAX 요청
				      $.ajax({
				        type: 'POST',
				        url: '/events',
				        data: eventData,
				        success: function(response) {
				        	
				        	 // 해당 지점 정보에 따라 backgroundColor를 설정
				            if (eventData.b_idx === '1') {
				              eventData.backgroundColor = 'blue';
				            } else if (eventData.b_idx === '2') {
				              eventData.backgroundColor = 'orange';
				            } else if (eventData.b_idx === '3') {
				              eventData.backgroundColor = 'black';
				            } else if (eventData.b_idx === '4') {
				              eventData.backgroundColor = 'green';
				            } else {
				              eventData.backgroundColor = 'green'; // 기본적으로 지정할 색상
				            }

				          console.log("일정 등록 성공");
				          calendar.addEvent(eventData);
				          $('#event-modal').modal('hide');
				          
				        },
				        error: function(e) {
				          console.log(e);
				        }
				      });
				    });
				    
				    

				    
				    // 캘린더 일정 캘린더에 보여주기요
				   $(document).ready(function() {
				  // 서버에서 전체 일정 데이터 가져오기
				  $.ajax({
				    url: "/calendarList",
				    type: "GET",
				    //list 에서 자기지점에 해당하는거 보여주기 랑 직급이 대표일때는 모두 보여줘야 하니까
				    data : {b_idx, position},
				    dataType: "json",
				    success: function(data) {
				      //console.log(data);
				      $.each(data.calendarlist, function(index, item) {
				        var dt_start = new Date(item.start_time);
				        var dt_end = new Date(item.end_time);
				
				        var newEvent = {
				          title: item.event_name,
				          start: dt_start.toISOString(),
				          end: dt_end.toISOString(),
				          id: item.calendar_no // 각 이벤트의 고유 ID를 설정하여 식별합니다.
				        };
				        //console.log(newEvent);
				        
				          // 해당 지점 정보에 따라 backgroundColor를 설정
				            if (item.b_idx === '1') {
				              newEvent.backgroundColor = 'blue';
				            } else if (item.b_idx === '2') {
				              newEvent.backgroundColor = 'orange';
				            } else if (item.b_idx === '3') {
				              newEvent.backgroundColor = 'black';
				            } else if (item.b_idx === '4') {
				              newEvent.backgroundColor = 'green';
				            } else {
				              newEvent.backgroundColor = 'green'; // 기본적으로 지정할 색상
				            }

				        
				        
				        calendar.addEvent(newEvent);
				      });
				
				      calendar.render();
				    },
				    error: function(e) {
				      console.log(e);
				    }
				  });
				
				  
				  
				  
				  
				// 선택된 지점의 값이 변경될 때마다 실행되는 함수
				  $("#branch").change(function() {
				    // 선택된 지점의 값(b_idx)을 가져옴
				    var selectedBranch = $(this).val();
				    console.log(selectedBranch);

				    if (selectedBranch === "listAll") {
				      // 선택된 지점이 "전체"일 경우 전체 일정을 표시
				      $.ajax({
				        url: "/calendarList",
				        type: "GET",
				        data: { b_idx, position },
				        dataType: "json",
				        success: function(data) {

				          // 캘린더 초기화
				          calendar.removeAllEvents();

				          // 전체 일정 리스트를 캘린더에 추가
				          $.each(data.calendarlist, function(index, item) {
				            var dt_start = new Date(item.start_time);
				            var dt_end = new Date(item.end_time);
				            //console.log(dt_start, dt_end);

				            var newEvent = {
				              title: item.event_name,
				              start: dt_start.toISOString(),
				              end: dt_end.toISOString(),
				              id: item.calendar_no
				            };
				            console.log(newEvent);
				            
				            // 해당 지점 정보에 따라 backgroundColor를 설정
				            if (item.b_idx === '1') {
				              newEvent.backgroundColor = 'blue';
				            } else if (item.b_idx === '2') {
				              newEvent.backgroundColor = 'orange';
				            } else if (item.b_idx === '3') {
				              newEvent.backgroundColor = 'black';
				            } else if (item.b_idx === '4') {
				              newEvent.backgroundColor = 'green';
				            } else {
				              newEvent.backgroundColor = 'green'; // 기본적으로 지정할 색상
				            }

				            calendar.addEvent(newEvent);
				          });

				          calendar.render();
				        },
				        error: function(e) {
				          console.log(e);
				        }
				      });
				    } else {
				      // 선택된 지점에 대한 필터링된 일정을 요청
				      $.ajax({
				        url: "/selectedBranch",
				        type: "GET",
				        data: { branch: selectedBranch, b_idx },
				        dataType: "json",
				        success: function(data) {
				          //console.log(data);

				          // 캘린더 초기화
				          calendar.removeAllEvents();

				          // 필터링된 일정 리스트를 캘린더에 추가
				          $.each(data.calendarlist, function(index, item) {
				            var dt_start = new Date(item.start_time);
				            var dt_end = new Date(item.end_time);
				            //console.log(dt_start, dt_end);

				            var newEvent = {
				              title: item.event_name,
				              start: dt_start.toISOString(),
				              end: dt_end.toISOString(),
				              id: item.calendar_no
				            };
				            console.log(newEvent);
				            
				            // 해당 지점 정보에 따라 backgroundColor를 설정
				            if (item.b_idx === '1') {
				              newEvent.backgroundColor = 'blue';
				            } else if (item.b_idx === '2') {
				              newEvent.backgroundColor = 'orange';
				            } else if (item.b_idx === '3') {
				              newEvent.backgroundColor = 'black';
				            } else if (item.b_idx === '4') {
				              newEvent.backgroundColor = 'green';
				            } else {
				              newEvent.backgroundColor = 'green'; // 기본적으로 지정할 색상
				            }

				            calendar.addEvent(newEvent);
				          });

				          calendar.render();
				        },
				        error: function(e) {
				          console.log(e);
				        }
				      });
				    }
				  });
				});
								 


				    
				    $(document).ready(function() {
				    	  // 등록 모달 창이 닫힐 때 입력 필드 초기화
				    	  $('#event-modal').on('hidden.bs.modal', function() {
				    	    $('#event-form')[0].reset();
				    	  });
				    	});
				    
				    console.log("${sessionScope.loginEmp.position}");
				    

				
				    
				    
				  </script>
					</div>
					<!--/. container-fluid -->
				</section>
			</div>


</body>
</html>