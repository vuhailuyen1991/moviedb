# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$ ->
  $('.movie_rating').on 'change', (evt) ->
    element = $(evt.currentTarget)
    movie_id = element.data("movie-id")
    rate = element.val()
    rating_path = Routes.movie_ratings_path(movie_id)
    $.ajax rating_path,
      type: 'POST'
      dataType: 'script'
      data: {
        rate: rate
      }
      error: (jqXHR, textStatus, errorThrown) ->
        console.log("AJAX Error: #{textStatus}")
      success: (data, textStatus, jqXHR) ->
        alert("Your rating has been recorded!")