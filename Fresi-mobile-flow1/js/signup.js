$(function() {
  
    function fullscreen(){
        jQuery('#hero').css({
            width: jQuery(window).width(),
            height: jQuery(window).height()
        });
    }
  
    fullscreen();

  jQuery(window).resize(function() {
       fullscreen();         
    });


    // $('input').data('holder',$('input').attr('placeholder'));
    // $('input').focusin(function(){
    //     $(this).attr('placeholder','');
    // });
    // $('input').focusout(function(){
    //     $(this).attr('placeholder',$(this).data('holder'));
    // });



})