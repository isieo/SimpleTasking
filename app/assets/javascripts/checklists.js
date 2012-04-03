function resizeToTask(){
  $('.task_item[data-task*=]').each(function(){
    $('.column[data-task="'+$(this).data("task")+'"]').height($(this).height());
  });
}

$(function(){
  $('.check-icons').click(function(){
    element = $(this);
    src = ['/assets/tick-off.png','/assets/tick-on.png','/assets/na.png']
    flag = element.data('flag') + 1
    if (flag > 2){
      flag = 0;
    }
    element.data('flag',flag);
    console.log(src[flag]);
    element.prop('src',src[flag]);
    jQuery.ajax({
      type: 'POST',
      url: '/columns/'+$(this).data('column')+'/answers/'+$(this).data('answer'),
      data: { _method:'PUT', flag: flag },
      dataType: 'text',
      success: function(data){
        ;
      },
      async: true
    });
  });
  jQuery(".best_in_place").best_in_place();
  
  jQuery(".best_in_place").change(resizeToTask)
  var numcols = $('.column_container > div').length ;

  $('.column_container').width(numcols * $('.columns .column').innerWidth());
  $('.columns').css('max-width',numcols * $('.columns .column').innerWidth());

  $('.best_in_place').change(function() {
    resizeToTask();
  });
  $('.desc-pop').popover('show');
  $('.task_desc').hide();
  
  
  $('div.task_item').click(function(){
    $(this).children('i:first').toggleClass("down");
    if ($(this).children('i:first').hasClass("down")){
      
      $(this).children('.task_desc:first').fadeIn(100,resizeToTask);
    }else{
      $(this).children('.task_desc:first').fadeOut(100,resizeToTask);
    }
  });
  
  resizeToTask();
});


