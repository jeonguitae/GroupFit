<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset='utf-8' />
  <title>여기에 페이지 이름 입력</title>
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
  <style>
    body {
      margin: 40px 10px;
      padding: 0;
      font-family: Arial, Helvetica Neue, Helvetica, sans-serif;
      font-size: 14px;
    }

    #calendar {
      max-width: 900px;
      margin: 0 auto;
    }

    .fixed-top-button {
      position: fixed;
      top: 10px;
      left: 50%;
      transform: translateX(-50%);
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
						<h1>calendar</h1>
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
				  <button onclick="openModal()">일정 등록</button>
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
				          <form>
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
				          <p id="event-detail-title"></p> <!-- 제목 -->
				          <p id="event-detail-start"></p> <!-- 시작 시간 -->
				          <p id="event-detail-end"></p> <!-- 종료 시간 -->
				          <!-- 추가 정보 요소 -->
				          <p id="event-detail-description"></p> <!-- 설명 -->
				        </div>
				      </div>
				      <div class="modal-footer">
				        <button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>
				      </div>
				    </div>
				  </div>
				</div>
				
				  <script>
				    var calendar = null;
				
				    $(document).ready(function() {
				    	  var calendarEl = document.getElementById('calendar');
				
				    	  calendar = new FullCalendar.Calendar(calendarEl, {
				    	    plugins: ['interaction', 'dayGrid', 'timeGrid', 'list'],
				    	    defaultDate: new Date(),
				    	    editable: false,
				    	    eventLimit: true,
				    	    events: [],
				    	    eventClick: function(info) {
				    	      // 클릭한 이벤트의 정보를 변수에 저장
				    	      var eventId = info.event.id;
				    	      var eventTitle = info.event.title;
				    	      var eventStart = info.event.start;
				    	      var eventEnd = info.event.end;
				
				    	      // 모달 창에 클릭한 이벤트의 정보를 표시
				    	      $('#event-detail-title').text('일정 이름: ' + eventTitle);
				    	      $('#event-detail-start').text('시작 시간: ' + eventStart);
				    	      $('#event-detail-end').text('종료 시간: ' + eventEnd);
				
				    	      // 모달 창 열기
				    	      $('#event-detail-modal').modal('show');
				    	    }
				    	  });
				
				    	  calendar.render();
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
				        end: endDateTime
				      };
				
				      // AJAX 요청
				      $.ajax({
				        type: 'POST',
				        url: '/events',
				        data: eventData,
				        success: function(response) {
				          console.log("일정 등록 성공");
				          calendar.addEvent(eventData);
				          $('#event-modal').modal('hide');
				        },
				        error: function(e) {
				          console.log(e);
				        }
				      });
				    });
				    
				    
			
				
				    
				    
				    
				    
				    $(document).ready(function() {
				      // 서버에서 캘린더 데이터 가져오기
				      $.ajax({
				        url: "/calendarList",
				        type: "GET",
				        dataType: "json",
				        success: function(data) {
				          console.log(data);
				          $.each(data.calendarlist, function(index, item) {
				            var dt_start = new Date(item.start_time);
				            var dt_end = new Date(item.end_time);
				            console.log(dt_start, dt_end);
				
				            var newEvent = {
				              title: item.event_name,
				              start: dt_start.toISOString(),
				              end: dt_end.toISOString(),
				              id: item.calendar_no // 각 이벤트의 고유 ID를 설정하여 식별합니다.
				            };
				            console.log(newEvent);
				            
				            calendar.addEvent(newEvent);
				          });
				
				          calendar.render();
				        },
				        error: function(e) {
				          console.log(e);
				        }
				      });
				    });
				    
				    
				    
				    $(document).ready(function() {
				        // 모달 닫기 버튼 클릭 시
				        $('.modal').on('hidden.bs.modal', function() {
				          $(this).find('form')[0].reset(); // 모달 내의 폼 리셋
				        });
				      });
				    
				   
				    
				 
				
				    
				    
				  </script>
					</div>
					<!--/. container-fluid -->
				</section>
			</div>


</body>
</html>