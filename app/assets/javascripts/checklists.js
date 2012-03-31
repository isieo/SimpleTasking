$(function(){
  $('.check-icons').click(function(){
    element = $(this);
    jQuery.ajax({
      type: 'POST',
      url: '/columns/'+$(this).data('column')+'/answers/'+$(this).data('answer'),
      data: { _method:'PUT' },
      dataType: 'text',
      success: function(data){
        element.prop('src',data);
      },
      async: true
    });
  });
  jQuery(".best_in_place").best_in_place();
  var numcols = $('.column_container > div').length ;

  $('.column_container').width(numcols * $('.columns .column').innerWidth());
  $('.columns').css('max-width',numcols * $('.columns .column').innerWidth());

  $('.best_in_place').change(function() {
    var value = $(this).children('form').children("input").val();
    $.ajax({
        success: function() {
          console.log($(this));
          $('span[data-url="'+$(this).data('url')+'"]').html(value).best_in_place();
          location.reload(true);
        }
    });
  });
  $('.desc-pop').popover('show');
});


