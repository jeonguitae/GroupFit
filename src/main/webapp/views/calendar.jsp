<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset='utf-8' />
  <link href='/packages/core/main.css' rel='stylesheet' />
  <link href='/packages/daygrid/main.css' rel='stylesheet' />
  <link href='https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css' rel='stylesheet'><!-- Bootstrap CSS 추가 -->
  <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
  <script src='/packages/core/main.js'></script>
  <script src='/packages/interaction/main.js'></script>
  <script src='/packages/daygrid/main.js'></script>
  <script src='https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js'></script><!-- Bootstrap JavaScript 추가 -->
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
  <button onclick="openModal()" class="fixed-top-button btn btn-primary">일정 등록</button>
  
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
  
  <script>
    var calendar = null;
    $(document).ready(function() {
      var calendarEl = document.getElementById('calendar');

      calendar = new FullCalendar.Calendar(calendarEl, {
        plugins: [ 'interaction', 'dayGrid' ],
        defaultDate: new Date(), // 현재 날짜로 설정
        editable: true,
        eventLimit: true, // allow "more" link when too many events,
        events: [
          // 이벤트 데이터
        ]
      });

      calendar.render();
    });

    function openModal() {
      $('#event-modal').modal('show');
    }

    // 저장 버튼 클릭 시 이벤트 처리
    $('#save-event-btn').click(function() {
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
        url: '/events', // 요청 주소를 /events로 설정
        data: eventData,
        success: function(response) {
          // 요청 성공 시 처리 로직
          // 예: 저장이 완료되었음을 사용자에게 알리고 일정을 다시 불러옴
          // 일정 업데이트 함수 호출
          console.log("일정 등록 성공");
          // 캘린더에 이벤트 추가
          calendar.addEvent(eventData);
          // 모달을 닫습니다.
          $('#event-modal').modal('hide');
        },
        error: function(e) {
          // 요청 실패 시 처리 로직
          console.log(e);
          // 예: 오류 메시지를 출력하거나 오류 처리를 위한 작업
        }
      });
    });

    $(document).ready(function() {
      // 서버에서 캘린더 데이터 가져오기
      $.ajax({
        url: "/calendarList", // 데이터를 가져올 URL
        type: "GET",
        dataType: "json",
        success: function(data) {
        	console.log(data);
          // 서버에서 받은 데이터를 처리하는 로직을 작성합니다.
          // data 변수에 서버에서 전달된 데이터가 들어있습니다.
          // 예시: 데이터를 반복문을 통해 FullCalendar에 이벤트로 추가합니다.
          $.each(data, function(index, item) {
            var newEvent = {
              title: item.event_name,
              start: item.start_time,
              end: item.end_time
            };
            calendar.addEvent(newEvent); // FullCalendar에 이벤트 추가
          });

          calendar.render(); // 캘린더 렌더링
        },
        error: function(e) {
          // 오류 처리 로직을 작성합니다.
          console.log(e);
        }
      });
    });
  </script>
</body>
</html>