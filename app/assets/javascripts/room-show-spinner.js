$(function(){
  // カウントスピナーの記述
  var step = 1;
  var adultMin = 1;
  var capacity = gon.capacity;
  var childInfantMin = 0;
  var infantMax = 10;
  var adultCount = $('.adult-count__input').val();
  var adultCount = parseInt(adultCount);
  var childCount = $('.child-count__input').val();
  var childCount = parseInt(childCount);
  var infantCount = $('.infant-count__input').val();
  var infantCount = parseInt(infantCount);

  $('.adult-count__spinner-up').on('click', function(){
    var adultChildCount = adultCount + childCount;
    if ( adultChildCount < capacity ){
      var plus_count = adultCount += step ;
      $('.adult-count__input').val(plus_count).change();
    }
  });
  $('.adult-count__spinner-down').on('click', function(){
    if ( adultCount > adultMin ){
      var minus_count = adultCount -= step ;
      $('.adult-count__input').val(minus_count).change();
    }
  });

  $('.child-count__spinner-up').on('click', function(){
    var adultChildCount = adultCount + childCount;
    if ( adultChildCount < capacity ){
      var plus_count = childCount += step ;
      $('.child-count__input').val(plus_count).change();
    }
  });
  $('.child-count__spinner-down').on('click', function(){
    if ( childCount > childInfantMin ){
      var minus_count = childCount -= step ;
      $('.child-count__input').val(minus_count).change();
    }
    if ( minus_count == 0) {
      $('.child-output').text('');
    }
  });

  $('.infant-count__spinner-up').on('click', function(){
    if ( infantCount < infantMax ){
      var plus_count = infantCount += step ;
      $('.infant-count__input').val(plus_count).change();
    }
  });
  $('.infant-count__spinner-down').on('click', function(){
    if ( infantCount > childInfantMin ){
      var minus_count = infantCount -= step ;
      $('.infant-count__input').val(minus_count).change();
    }
    if ( minus_count == 0) {
      $('.infant-output').text('');
    }
  });

  // スピナーカウントに対してのアウトプット
  $('#room_appointment_number_of_adult').change(function() {
    $('.adult-output').text(`大人${adultCount}人`)
  });

  $('#room_appointment_number_of_child').change(function() {
    $('.child-output').text(`子ども${childCount}人`);
  });

  $('.infant-count__input').change(function() {
    $('.infant-output').text(`乳幼児${infantCount}人`);
  });

  // 予約日セレクトに対してのアウトプット
  $('#room_appointment_check_in_date').change(function(){
    var checkInDate = $('#room_appointment_check_in_date option:selected').text();
    var checkInDate = checkInDate.replace(/-/g, '/');
    $('.checkin-preview').text(checkInDate);
  });

  $('#room_appointment_check_out_date').change(function(){
    var checkOutDate = $('#room_appointment_check_out_date option:selected').text();
    var checkOutDate = checkOutDate.replace(/-/g, '/');
    $('.checkout-preview').text(checkOutDate);
  });

  // 予約できる日に制限をかける
  // $('#room_appointment_check_in_date').change(function(){
  //   var selectInDate = $('#room_appointment_check_in_date option:selected').text();
  //   console.log(selectInDate);
  //   $('option:contains(`${selectInDate}`)').remove();
  //   // var test = $(“:contains('2018-05-19')”);
  //   // console.log(test);
  //   // // console.log(test);
  // });
});


