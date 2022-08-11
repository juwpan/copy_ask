$(function(){
  $('.description-game').hide();

  $('.description').click(function(){
    $(this).next().slideToggle({duration: 800});
  });
});