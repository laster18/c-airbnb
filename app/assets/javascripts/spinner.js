$(function(){

  var step = 1;
  var min = 1;
  var max = 50;
  var count = $('.bed-count__input').val();
  var count = parseInt(count);

  $('.bed-count__spinner-up').on('click', function(){
    if ( count < max ){
      var plus_count = count += step ;
      $('.bed-count__input').attr('value', plus_count);
    }
  });
  $('.bed-count__spinner-down').on('click', function(){
    if ( count > min ){
      var minus_count = count -= step ;
      $('.bed-count__input').attr('value', minus_count);
    }
  });

  $('.capacity-count__spinner-up').on('click', function(){
    if ( count < max ){
      var plus_count = count += step ;
      $('.capacity-count__input').attr('value', plus_count);
    }
  });
  $('.capacity-count__spinner-down').on('click', function(){
    if ( count > min ){
      var minus_count = count -= step ;
      $('.capacity-count__input').attr('value', minus_count);
    }
  });
});
