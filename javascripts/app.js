$(function() {
  $("#search").autocomplete({
    source: function(request, response) {
      $.ajax({
        url: '/',
        dataType: 'json',
        data: {
          search: request.term // Send the search query parameter in the request
        },
        success: function( data ) {
          response(data);
        }
      });
    }
  });
});