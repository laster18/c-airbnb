$(function(){
  $('.save-button').on('click', function(){
    $('.favorite-modal-wrapper').removeClass('favorite-modal');
  });

  $('.favorite-close-button').on('click', function(){
    $('.favorite-modal-wrapper').addClass('favorite-modal');
  });

  $('.favorite-item').on('click', function(){
    var favoriteFolderId = $('.favorite-item').data('id');
    var roomId = $('.s-main').data('id');
    $.ajax ({
      url: `/rooms/${roomId}/favorite_folders/${favoriteFolderId}/favorites`,
      type: 'POST',
      dataType: 'json'
    })
    .always(function(){
      conlose.log('test');
    });
  });







});
