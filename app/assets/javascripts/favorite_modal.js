$(function(){
  $('.save-button').on('click', function(){
    $('.favorite-modal-wrapper').removeClass('favorite-modal');
  });

  $('.favorite-close-button').on('click', function(){
    $('.favorite-modal-wrapper').addClass('favorite-modal');
  });
});
