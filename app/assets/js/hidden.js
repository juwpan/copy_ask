$(function(){
  $('.description-question').hide();

  $('.description').click(function(){
    $(this).next().slideToggle({duration: 800});
  });
});