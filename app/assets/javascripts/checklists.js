function resizeToTask(){
  $('.task_item[data-task*=]').each(function(){
    $('.column[data-task="'+$(this).data("task")+'"]').height($(this).height());
  });
}

function toggleTaskDropDown(task_element){
  task_element.toggleClass("down");
  if (task_element.hasClass("down")){
    
    task_element.next('.task_desc').fadeIn(100,resizeToTask);
  }else{
    task_element.next('.task_desc').fadeOut(100,resizeToTask);
  }
}

function setPrivateImage(element){
    element.css("cursor","pointer").css("display","block").css("height","50px").css("width","50px");
    if (element.text() == 'private'){
      element.css("background",'url("/assets/lock.png")');
    }else{
      element.css("background",'url("/assets/unlock.png")');
    };
    element.css("text-indent", "200%");
    element.css("overflow", "hidden");
    element.css("white-space", "nowrap");
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
  
  
  
  $('.best_in_place[data-attribute=private]').live('ajax:success',function(){
    setPrivateImage($(this));
  });
  $('.desc-pop').popover('show');
  $('.task_desc').hide();
  
  $('.task_item i').click(function(){
    toggleTaskDropDown($(this))
  });
  
  setPrivateImage($('.best_in_place[data-attribute=private]'));
  resizeToTask();
});


