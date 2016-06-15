<!DOCTYPE html!>
<html lang="es">
<head>
   <?php include 'head.php' ?>
    <title>Sistema Contable</title>
    <link href='complementos/fullcalendar-v2.6.1/css/fullcalendar.css' rel='stylesheet'/>
    <link href='complementos/fullcalendar-v2.6.1/css/fullcalendar.print.css' rel='stylesheet' media='print' />
    <script src='complementos/fullcalendar-v2.6.1/js/moment.min.js'></script>
    <script src='complementos/fullcalendar-v2.6.1/js/fullcalendar.min.js'></script>
    <style> #calendar {max-width: 900px;margin: 0 auto;} </style>
</head>
<body>
    <div id="wrapper">
        <?php include 'menu.php'; ?>
        <!-- Contenido -->
        <div id="page-wrapper">
            <div class="container-fluid">
                <div class="row">
                    <ol class="breadcrumb">
                        <li>
                            <a href="index.php"><span class="fa fa-fw fa-home"></span> Inicio</a>
                        </li>
                    </ol>
                </div> 
            </div>
            <div class="row">
                <div id='calendar'></div>
            </div> 
        </div>
    </div>
</body>
<script>
    $(document).ready(function() {
        $('#calendar').fullCalendar({
            header: {
                left: 'prev,next today',
                center: 'title',
                right: 'month,agendaWeek,agendaDay'
            },
            defaultDate: '2016-03-15',
            selectable: true,
            selectHelper: true,
            select: function(start, end) {
                var title = prompt('Event Title:');
                var eventData;
                if (title) {
                    eventData = {
                        title: title,
                        start: start,
                        end: end
                    };
                    $('#calendar').fullCalendar('renderEvent', eventData, true); // stick? = true
                }
                $('#calendar').fullCalendar('unselect');
            },
            editable: true,
            eventLimit: true, // allow "more" link when too many events
            events: [
                {
                    title: 'All Day Event',
                    start: '2016-03-01'
                },
                {
                    title: 'Long Event',
                    start: '2016-03-07',
                    end: '2016-03-10'
                },
                {
                    id: 999,
                    title: 'Repeating Event',
                    start: '2016-03-09T16:00:00'
                },
                {
                    id: 999,
                    title: 'Repeating Event',
                    start: '2016-03-16T16:00:00'
                },
                {
                    title: 'Conference',
                    start: '2016-03-11',
                    end: '2016-03-13'
                },
                {
                    title: 'Meeting',
                    start: '2016-03-12T10:30:00',
                    end: '2016-03-12T12:30:00'
                },
                {
                    title: 'Lunch',
                    start: '2016-03-12T12:00:00'
                },
                {
                    title: 'Meeting',
                    start: '2016-03-12T14:30:00'
                },
                {
                    title: 'Happy Hour',
                    start: '2016-03-12T17:30:00'
                },
                {
                    title: 'Dinner',
                    start: '2016-03-12T20:00:00'
                },
                {
                    title: 'Birthday Party',
                    start: '2016-03-13T07:00:00'
                },
                {
                    title: 'Click for Google',
                    url: 'http://google.com/',
                    start: '2016-03-28'
                }
            ]
        });
    });
</script>
</html>
