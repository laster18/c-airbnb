$(function(){

  function appendHTML(message) {
    var html =
    `<div class= "s-message-send">
       <div class= "s-message-send-avatar">
         <img src= "${message.avatar}" alt= "avatar" class= "s-message-avatar-image">
       </div>
       ${message.message}
     </div>`
     $('.s-message-lists').append(html);
  }

  $('#new_message').on('submit', function(e){
    e.preventDefault();
    var formData = new FormData(this)
    var url = $(this).attr('action')
    $.ajax({
      url: url,
      type: "POST",
      data: formData,
      dataType: 'json',
      processData: false,
      contentType: false
    })
    .done(function(message) {
      appendHTML(message);
      $('#message_message').val('');
      $('.s-message-area-send__button').prop('disabled', false);
    })
  });
});
