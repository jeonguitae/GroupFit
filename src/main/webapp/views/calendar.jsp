<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>AdminLTE 3 | Calendar</title>
  

  <!-- Google Font: Source Sans Pro -->
  <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700&display=fallback">
  <!-- Font Awesome -->
  <link rel="stylesheet" href="/plugins/fontawesome-free/css/all.min.css">
  <!-- fullCalendar -->
  <link rel="stylesheet" href="/plugins/fullcalendar/main.css">
  <!-- Theme style -->
  <link rel="stylesheet" href="/dist/css/adminlte.min.css">
  
  
</head>
<body class="hold-transition sidebar-mini">

<!-- ** 2.Event Modal 팝업 창으로 사용할 모달 추가 -->
<div class="modal fade" id="event-modal" tabindex="-1" role="dialog" aria-labelledby="event-modal-label" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="event-modal-label">일정 등록</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <!-- 여기에 일정 등록 폼을 추가하세요 -->
        <!-- 일정 등록 폼 -->
<form>
  <div class="form-group">
    <label for="event-name">이름</label>
    <input type="text" class="form-control" id="event-name" placeholder="이름을 입력하세요">
  </div>
  
  <!-- 시작 시간 입력 필드 -->
  <div class="form-group">
    <label for="start-datetime">시작 시간</label>
    <input id="start-datetime" type="datetime-local" class="form-control" value="<?php echo date('Y-m-d\TH:i'); ?>">
  </div>
  
  <!-- 종료 시간 입력 필드 -->
  <div class="form-group">
    <label for="end-datetime">종료 시간</label>
    <input id="end-datetime" type="datetime-local" class="form-control" value="<?php echo date('Y-m-d\TH:i'); ?>">
  </div>
</form>
        
        <!-- 예: 제목, 시작일, 종료일 등의 입력 필드 -->
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">취소</button>
        <button type="button" class="btn btn-primary" id="save-event-btn">저장</button>
      </div>
    </div>
  </div>
</div>
<div class="wrapper">
 

  <!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <div class="content-header">
  <div class="container-fluid">
    <div class="row mb-2">
      <div class="col-sm-6">
        <h1>Calendar</h1>
      </div>
      <!-- ** 1. 일정 등록 버튼 추가 -->
      <div class="col-sm-6 text-right">
        <button class="btn btn-primary" id="add-event-btn" data-toggle="modal" data-target="#event-modal">일정 등록</button>
      </div>
    </div>
  </div><!-- /.container-fluid -->
</div>

    <!-- Main content -->
    <section class="content">
      <div class="container-fluid">
        <div class="row">
          <div class="col-md-3">
            <div class="sticky-top mb-3">
              <div class="card">
         
                <!-- /.card-body -->
              </div>
             </div>
            </div>
 
          <!-- /.col -->
          <div class="col-md-12">
            <div class="card card-primary">
              <div class="card-body p-0">
                <!-- THE CALENDAR -->
                <div id="calendar"></div>
              </div>
              <!-- /.card-body -->
            </div>
            <!-- /.card -->
          </div>
          <!-- /.col -->
        </div>
        <!-- /.row -->
      </div><!-- /.container-fluid -->
    </section>
    <!-- /.content -->
  </div>
  <!-- /.content-wrapper -->

  <footer class="main-footer">
    <div class="float-right d-none d-sm-block">
      <b>Version</b> 3.2.0
    </div>
    <strong>Copyright &copy; 2014-2021 <a href="https://adminlte.io">AdminLTE.io</a>.</strong> All rights reserved.
  </footer>

  <!-- Control Sidebar -->
  <aside class="control-sidebar control-sidebar-dark">
    <!-- Control sidebar content goes here -->
  </aside>
  <!-- /.control-sidebar -->
</div>
<!-- ./wrapper -->


<!-- jQuery -->
<script src="/plugins/jquery/jquery.min.js"></script>
<!-- Bootstrap -->
<script src="/plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
<!-- jQuery UI -->
<script src="/plugins/jquery-ui/jquery-ui.min.js"></script>
<!-- AdminLTE App -->
<script src="/dist/js/adminlte.min.js"></script>
<!-- fullCalendar 2.2.5 -->
<script src="/plugins/moment/moment.min.js"></script>
<script src="/plugins/fullcalendar/main.js"></script>
<!-- AdminLTE for demo purposes -->
<script src="/dist/js/demo.js"></script>
<!-- Page specific script -->
<script>
  $(function () {


    /* initialize the calendar
     -----------------------------------------------------------------*/
    //Date for the calendar events (dummy data)
    var date = new Date()
    var d    = date.getDate(),
        m    = date.getMonth(),
        y    = date.getFullYear()

    var Calendar = FullCalendar.Calendar;
    var Draggable = FullCalendar.Draggable;

    var containerEl = document.getElementById('external-events');
    var calendarEl = document.getElementById('calendar');

    // initialize the external events
    // -----------------------------------------------------------------


    var calendar = new Calendar(calendarEl, {
      headerToolbar: {
        left  : 'prev,next today',
        center: 'title',
        right : 'dayGridMonth'
      },
      themeSystem: 'bootstrap',
      //Random default events
      events: [ 
      ],
      editable  : true,
      droppable : true, // this allows things to be dropped onto the calendar !!!
      drop: function(info) {
         // Remove the element from the "Draggable Events" list
         info.draggedEl.parentNode.removeChild(info.draggedEl);
       }
    });

    calendar.render();
    // $('#calendar').fullCalendar()

    /* ADDING EVENTS */
    var currColor = '#3c8dbc' //Red by default
    // Color chooser button
    $('#color-chooser > li > a').click(function (e) {
      e.preventDefault()
      // Save color
      currColor = $(this).css('color')
      // Add color effect to button
      $('#add-new-event').css({
        'background-color': currColor,
        'border-color'    : currColor
      })
    })
    $('#add-new-event').click(function (e) {
      e.preventDefault()
      // Get value and make sure it is not null
      var val = $('#new-event').val()
      if (val.length == 0) {
        return
      }

      // Create events
      var event = $('<div />')
      event.css({
        'background-color': currColor,
        'border-color'    : currColor,
        'color'           : '#fff'
      }).addClass('external-event')
      event.text(val)
      $('#external-events').prepend(event)

      // Add draggable funtionality
      ini_events(event)

      // Remove event from text input
      $('#new-event').val('')
    })
    
    // ** 3.일정 등록 이벤트 핸들러 추가
 	// 일정 등록 버튼 클릭 시 팝업 창 모달 열기
    $('#add-event-btn').click(function () {
      $('#event-modal').modal('show');
    });

    // 저장 버튼 클릭 시 일정 등록 처리
    $('#save-event-btn').click(function () {
      // 여기에 일정 등록 처리 로직을 추가하세요
      // 예: 입력된 값들을 가져와서 새로운 이벤트를 생성하고 캘린더에 추가하는 등의 작업
      // 새로운 이벤트를 생성한 후 팝업 창 모달을 닫을 수도 있습니다:
      // $('#event-modal').modal('hide');
    });
  })
  
   
  
</script>

</body>
</html>
