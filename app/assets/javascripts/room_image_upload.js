$(function(){

  function appendImageFirst(data) {
    var image = data.image
    var html = `<img src= ${image} style= " width: 100%;">`
    var form = `<label class="photos-frame__field" for="room_image_image">写真を追加する。
                  <input class="photos-frame__hidden" type="file" name="room_image[image]" id="room_image_image">
                </label>`

    $('.add-photos').removeClass('photos-form-hidden');
    $('.add-photos__first').append(html);

    if (!$('.add-photos__more').find('.photos-frame__field').length) {
      $('.add-photos__more').append(form);
    }
  }

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
      $('.photos-form').addClass('photos-form-hidden');
      appendImageFirst(data);
    })
  });
});
