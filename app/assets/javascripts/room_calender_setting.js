$(function(){

  $('.fc-button').on('click', function(){
    $.ajax({
      url: location.href,
      type: "GET",
      dataType: 'json'
    })
    .done(function(dates){
      console.log("test")
      dates.forEach(function(date){
        $(`[ data-date= ${date.date}]`).addClass('reservation-true');
      });
    })

    $('.fc-day').on('click', function(){
      if ( $(this).hasClass('reservation-true') ){
        $(this).removeClass('reservation-true');
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
        $(this).addClass('reservation-true');
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

  })
})
