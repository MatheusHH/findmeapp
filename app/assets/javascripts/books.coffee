# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

//= require moment
//= require moment/pt-br
//= require bootstrap-datetimepicker

$(document).on 'turbolinks:load', ->
  $('#datetimepicker').datetimepicker
    locale: 'pt-br'
    format: 'DD-MM-YYYY HH:mm'

  $('#initialdate').datepicker
    locale: 'pt-br'
    format: 'YYYY-MM-DD HH:mm'

  $('#finaldate').datepicker
    locale: 'pt-br'
    format: 'YYYY-MM-DD HH:mm'
  return
  



