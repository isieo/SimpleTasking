$(function(){
  $('.check-icons').click(function(){
    element = $(this);
    jQuery.ajax({
      type: 'POST',
      url: '/columns/'+$(this).data('column')+'/answers/'+$(this).data('answer'),
      data: { _method:'PUT' },
      dataType: 'json',
      success: function(data){
        element.html(data);
      },
      async: false
    });

  });
  jQuery(".best_in_place").best_in_place();
  var numcols = $('.column_container > div').length ;

  $('.column_container').width(numcols * $('.columns .column').innerWidth());
  $('.columns').css('max-width',numcols * $('.columns .column').innerWidth());
});


