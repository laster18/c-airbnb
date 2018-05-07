$(function(){
  var userId = $('.avatar-form').data('id');

  $("#user_avatar").change(function(){
    $('#edit_user_' + `${userId}`).submit();
  })

  $('#edit_user_' + `${userId}`).on('submit', function(e){
    e.preventDefault();
    var formData = new FormData(this);
    var url = $(this).attr('action')
    $.ajax({
      url: url,
      type: "POST",
      data: formData,
      dataType: 'json',
      processData: false,
      contentType: false
    })
    .done(function(data){
      console.log(data)
      $('#current_avatar').attr("src", `${data.avatar}`);
    })
    .fail(function(){
      alert('アップロードに失敗しました');
    })
  });
});

