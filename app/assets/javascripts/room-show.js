$(function(){
  $('.person-number-input').on('click', function(){
    $('.number-of-people').removeClass('show-input-modal');
  });

  $('.show-input-close__button').on('click', function(){
    $('.number-of-people').addClass('show-input-modal');
  });
});
