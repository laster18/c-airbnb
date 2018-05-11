$(function(){

  var step = 1;
  var min = 1;
  var max = 50;
  var bedCount = $('.bed-count__input').val();
  var bedCount = parseInt(bedCount);
  var capacityCount = $('.capacity-count__input').val();
  var capacityCount = parseInt(capacityCount);
  var bathroomCount = $('.bathroom-count__input').val();
  var bathroomCount = parseInt(bathroomCount);

  $('.bed-count__spinner-up').on('click', function(){
    if ( bedCount < max ){
      var plus_count = bedCount += step ;
      $('.bed-count__input').attr('value', plus_count);
    }
  });
  $('.bed-count__spinner-down').on('click', function(){
    if ( bedCount > min ){
      var minus_count = bedCount -= step ;
      $('.bed-count__input').attr('value', minus_count);
    }
  });

  $('.capacity-count__spinner-up').on('click', function(){
    if ( capacityCount < max ){
      var plus_count = capacityCount += step ;
      $('.capacity-count__input').attr('value', plus_count);
    }
  });
  $('.capacity-count__spinner-down').on('click', function(){
    if ( capacityCount > min ){
      var minus_count = capacityCount -= step ;
      $('.capacity-count__input').attr('value', minus_count);
    }
  });

  $('.bathroom-count__spinner-up').on('click', function(){
    if ( bathroomCount < max ){
      var plus_count = bathroomCount += step ;
      $('.bathroom-count__input').attr('value', plus_count);
    }
  });
  $('.bathroom-count__spinner-down').on('click', function(){
    if ( bathroomCount > min ){
      var minus_count = bathroomCount -= step ;
      $('.bathroom-count__input').attr('value', minus_count);
    }
  });
});
