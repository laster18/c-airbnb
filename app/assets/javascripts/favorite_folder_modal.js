$(function(){
  $('.favorite-index-title__button').on('click', function(){
    $('.f-favorite-modal-wrapper').removeClass('favorite-folder-modal');
  });
  $('.favorite-close-button').on('click', function(){
    $('.f-favorite-modal-wrapper').addClass('favorite-folder-modal');
  });
});
