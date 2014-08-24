# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

ready = ->

  $('#_form').click (e)->
    e.preventDefault()
    row = $('tr.new_budget_row').clone().removeClass('hidden new_budget_row');
    $('tr.actions').before(row);
    


  $(document).on 'click', '.delete-link', (e)->
    e.preventDefault()
    $(@).closest('tr').remove()

$(document).ready(ready)



jQuery ->
  $('#budgets').dataTable()