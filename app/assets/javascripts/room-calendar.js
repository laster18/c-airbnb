$(function(){
  //予約可能日をroom_calendarsテーブルに保存
  //クリックでDBに保存し、reservation-trueクラスをつける。
  //もう一度クリックでデータベースから削除し、reservation-trueを消す。

  // ↓すでに予約可能日として保存してある要素にreservation-trueを付ける。
  var dates = gon.dates_json
  var dates = JSON.parse(dates);
  dates.forEach(function(date){
    $(`[ data-date= ${date}]`).addClass('reservation-true');
  });
  // ↓日付クリック時の処理
  $('.fc-day').on('click', function(){
    if ( $(this).hasClass('reservation-true') ){
      $(this).removeClass('reservation-true'); // ↓予約可能日削除処理
      var tday = $(this).data('date');
      $.ajax({
        url: location.href,
        type: "DELETE",
        data: {date: tday},
        dataType: 'json'
      })
      .done(function(data){
      })
    } else {
      $(this).addClass('reservation-true'); // ↓予約可能日保存処理
      var tday = $(this).data('date');
      $.ajax({
        url: location.href ,
        type: "POST",
        data: {date: tday},
        dataType: 'json'
      })
    }
  });

  $('.fc-other-month').text('');
  $('.fc-other-month').attr('data-date','');
  $('.fc-other-month').removeClass('fc-day');
  $('.fc-past').removeClass('fc-day');
});
