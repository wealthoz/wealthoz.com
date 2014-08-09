# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

jQuery ->
  $('#transactions').dataTable()
  
jQuery ->
  $('#bs_table').dataTable(ordering: false)  

jQuery ->
  $('#pl_m_table').dataTable(ordering: false)  

jQuery ->
  $('#pl_w_table').dataTable(ordering: false)  

ready = ->

  $('#_form2').click (e)->
    e.preventDefault()
    row = $('tr.new_ledger_row').clone().removeClass('hidden new_ledger_row');
    $('tr.actions').before(row);

  $(document).on 'click', '.delete-link', (e)->
    e.preventDefault()
    $(@).closest('tr').remove()

$(document).ready(ready)



