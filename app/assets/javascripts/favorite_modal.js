$(function(){
  $('.save-button').on('click', function(){
    $('.favorite-modal-wrapper').removeClass('favorite-modal');
  });

  $('.favorite-close-button').on('click', function(){
    $('.favorite-modal-wrapper').addClass('favorite-modal');
  });

  $(document).on('click', '.favorite-item', function(){
    if ($(this).hasClass('delete-favorite')) {
      $(this).removeClass('delete-favorite');
      $(this).find('.favorite-heart').attr("style", "color: black;")
      var favoriteFolderId = $(this).data('id');
      var roomId = $('.s-main').data('roomId');
      $.ajax ({
        url: `/rooms/${roomId}/favorite_folders/${favoriteFolderId}/favorites`,
        type: 'DELETE',
        dataType: 'json'
      })
      .always(function(){
        if ($('.favorite-item').hasClass('delete-favorite')) {
          ""
        } else {
          $('.s-like-button').attr("style", "color: black;");
        }
      })
    } else {
      $(this).addClass('delete-favorite');
      $(this).find('.favorite-heart').attr("style", "color: red;");
      $('.s-like-button').attr("style", "color: red;");
      var favoriteFolderId = $(this).data('id');
      var roomId = $('.s-main').data('roomId');
      $.ajax ({
        url: `/rooms/${roomId}/favorite_folders/${favoriteFolderId}/favorites`,
        type: 'POST',
        dataType: 'json'
      })
    }
  });

});
