$(function(){
  $('#room_image_image').change(function(){
    $('#new_room_image').submit();
  });

  $("#new_room_image").on('submit', function(e){
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
      console.log('test');
    })
  });
});
