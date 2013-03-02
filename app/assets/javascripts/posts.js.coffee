# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/
#
$ ->
  lastPost = { id: 0 }
  postTemplate = Handlebars.compile($('#post-template').html())

  replaceUpMessageInDOM = ->
    console.log "replacing message if necessary"
    $.ajax
      type: 'get'
      url: '/posts'
      dataType: 'json'
      beforeSend: ->
        $('.loading').fadeIn()
      success: (response) ->
        $('.loading').hide()
        if response.updated_at != lastPost.updated_at
          response.status = "alert-success"
        else
          response.status = ""
        lastPost = response
        $('.message_container').html(postTemplate(response))
      error: (response, textStatus, errorThrown) ->
        maintenanceMessage = 
          title: "No cluster response! Should be back up shortly."
          status: 'alert-error'
        $('.message_container').html(postTemplate(maintenanceMessage))

  replaceUpMessageInDOM()

  setInterval (-> replaceUpMessageInDOM()), 5000
