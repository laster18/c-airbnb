$(function(){
  console.log('test');
  $('.d-message-top-wrapper__select').on('change',function(){
    var kind = $('.d-message-top-wrapper__select option:selected').val();
    if ( kind == 'all' ) {
      $('.d-message-item').css('display', 'block')
    } else {
      $('.d-message-item').css('display', 'none');
      $(`[ data-kind= '${kind}' ]`).css('display', 'block');
    }
  });
});
