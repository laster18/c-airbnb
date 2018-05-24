$(function(){

  $('.favorite-body__folder-create').on('click', function(){
    $('.favorite-body__folder-create').addClass('close-folder-create-button');
    $('.s-favorite-create-folder').removeClass('close-favorite-folder-form');
  });

  $('.f-favorite-cansel').on('click', function(){
    $('.favorite-body__folder-create').removeClass('close-folder-create-button');
    $('.s-favorite-create-folder').addClass('close-favorite-folder-form');
  });

  $('#new_favorite_folder').on('submit', function(e){
    e.preventDefault();
    var formData = new FormData(this);
    var url = $(this).attr('action')
    $.ajax({
      url: url,
      type: 'POST',
      data: formData,
      dataType: 'json',
      processData: false,
      contentType: false
    })
    .done(function(folder){
      $('#favorite_folder_name').val('');
      $('.f-favorite-save button').prop('disabled', false);
      var html = `<div class='favorite-item clearfix' data-id= ${folder.id}>
                    <div class='favorite-item__text'>
                      ${ folder.name }
                    </div>
                    <div class='favorite-item__mark'>
                      <i class='fa fa-heart favorite-heart'></i>
                    </div>
                  </div>`

      $('.favorite-folder-lists').append(html);
    })
    .fail(function(){
      alert('タイトルを入力してください');
    })
  });
});
