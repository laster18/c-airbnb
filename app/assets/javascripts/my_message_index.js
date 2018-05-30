$(function(){
  $('.message-select-js').on('change',function(){
    var kind = $('.message-select-js option:selected').val();
    if ( kind == 'all' ) {
      $('.d-message-item').css('display', 'block')
    } else {
      $('.d-message-item').css('display', 'none');
      $(`[ data-kind= '${kind}' ]`).css('display', 'block');
    }
  });
});
