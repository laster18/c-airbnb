// $(function () {
//     console.log("test");
//     $('#datetimepicker6').datetimepicker();
//     $('#datetimepicker7').datetimepicker({
//         useCurrent: false //Important! See issue #1075
//     });
//     $("#datetimepicker6").on("dp.change", function (e) {
//         $('#datetimepicker7').data("DateTimePicker").minDate(e.date);
//     });
//     $("#datetimepicker7").on("dp.change", function (e) {
//         $('#datetimepicker6').data("DateTimePicker").maxDate(e.date);
//     });

// });

$(function(){
  // $('.datepicker1').datetimepicker({
  //   format : "YYYY/MM/DD",
  //   icons: {
  //     previous: "fa fa-arrow-left",
  //     next: "fa fa-arrow-right"
  //   }
  // });
  var dateFormat   = 'yy/mm/dd';
  var disableDates = ['2015/01/01', '2015/01/03']; // ここがミソ
  $(".datepicker").datepicker({
    format      : dateFormat,
    language    : 'ja',
    autoclose   : true,
    clearBtn    : true,
    clear       : '閉じる',
    changeMonth : true,
    changeYear  : true,
    startDate   : 'today',
    beforeShowDay : function(date) {
      var disableDate = $.datepicker.formatDate(dateFormat, date);
      return ( disableDates.indexOf(disableDate) == -1 );
    }
    icons: {
      previous: "fa fa-arrow-left",
      next: "fa fa-arrow-right"
    }
});
  // $('.datetimepicker').datetimepicker({
  //   format : "YYYY/MM/DD HH:mm",
  //   icons: {
  //     time: "fa fa-clock-o",
  //     date: "fa fa-calendar",
  //     up: "fa fa-arrow-up",
  //     down: "fa fa-arrow-down",
  //     previous: "fa fa-arrow-left",
  //     next: "fa fa-arrow-right"
  //   }
  // });
});

// $(function(){
//     var dateFormat   = 'yy/mm/dd';
//     var disableDates = ['2018/05/20', '2018/05/21'];
//     $('.datepicker1').datepicker({
//         //オプション
//         todayHighlight : false,
//         autoclose : true,
//         keyboardNavigation : false
//         format      : dateFormat,
//         language    : 'ja',
//         autoclose   : true,
//         clearBtn    : true,
//         clear       : '閉じる',
//         changeMonth : true,
//         changeYear  : true,
//         startDate   : 'today',
//         beforeShowDay : function(date) {
//         var disableDate = $.datepicker.formatDate(dateFormat, date);
//         return ( disableDates.indexOf(disableDate) == -1 );
//         }
//     });

//     $('.datepicker2').datepicker({
//         //オプション
//         todayHighlight : false,
//         autoclose : true,
//         keyboardNavigation : false
//     });
// });

// $(function(){
//     $('.datepicker1').datepicker()
//         .on('changeDate', function(e){ //開始日が選択されたら
//             $('.datepicker2').datepicker('show'); //終了日のカレンダーを表示
//             selected_date = e['date']; //開始日のデータ取得
//             yyyy = selected_date.getFullYear();
//             mm = selected_date.getMonth() + 1;
//             dd = selected_date.getDate();
//             sd = computeDate(yyyy, mm, dd, 0); //0000-00-00の形で指定日後が返ってくる
//             $('.datepicker2').datepicker('setStartDate', sd); //start日より前の日を無効化する
//     });
// });

// function computeDate(year, month, day, addDays) {
//     var dt = new Date(year, month - 1, day);
//     var baseSec = dt.getTime();
//     var addSec = addDays * 86400000;//日数 * 1日のミリ秒数
//     var targetSec = baseSec + addSec;
//     dt.setTime(targetSec);
//     return dt;
// }
