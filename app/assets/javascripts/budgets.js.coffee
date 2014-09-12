# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

ready = ->
  if $('#new-budget-form')
    row = $('tr.new_budget_row').clone().removeClass('hidden new_budget_row');
    $('tr.actions').before(row);

  $(document).on 'change keyup', '#new-budget-form .form-group .required-field:input:visible', ->
    if $(@).val() == ''
      $(@).parent('.form-group').addClass('has-error')
      $(@).parent('.form-group').removeClass('has-success')
    else
      $(@).parent('.form-group').addClass('has-success')
      $(@).parent('.form-group').removeClass('has-error')



  $('#_form').click (e)->
    e.preventDefault()
    row = $('tr.new_budget_row').clone().removeClass('hidden new_budget_row');

    $('tr.actions').before(row);



  $(document).on 'click', '.delete-link', (e)->
    e.preventDefault()
    $(@).closest('tr').remove()
    $.ajax(
      url: '/accounts/check'
      dataType: 'json'
    ).done calculateWealth

  $('#new-budget-form-submit').attr('disabled', 'disabled')


  calculateWealth =  (data)->
    $.each data.grouped_accounts, (fs_id, account_ids)->
      fs_name = data.fss[fs_id]
      total = 0
      $('select.budget-account-select:visible option:selected').each ->
        if $(@).closest('tr').find('.budget-ammount-input').val()
          if $.inArray(parseInt($(@).val()), account_ids) > -1
            total += parseInt($(@).closest('tr').find('.budget-ammount-input').val()) || 0
        else
          console.log 'nqma'

      $(".#{fs_name.toLowerCase()}").find('.badge').html(total)

      assets   = parseInt($('.assets .badge').html())   || 0
      debt     = parseInt($('.debt .badge').html())     || 0
      income   = parseInt($('.income .badge').html())   || 0
      expenses = parseInt($('.expenses .badge').html()) || 0

      unbalanced = assets + debt - income - expenses
      $('.unbalanced-amount').html(unbalanced)


      wealth = assets + debt
      $('.wealth').html(wealth)

      disabled = false
      $('#new-budget-form .form-group .required-field:input:visible').each ->
        if $(@).val() == ''
          disabled = true

      if unbalanced == 0 && not disabled
        $('#new-budget-form-submit').attr('disabled', false)
      else
        $('#new-budget-form-submit').attr('disabled', true)

  ajaxCalculateWealth = ->
    $.ajax(
      url: '/accounts/check'
      dataType: 'json'
    ).done calculateWealth

  $(document).on 'change', '.budget-account-select', ->
    if $(@).closest('tr').find('.budget-ammount-input').val()
      ajaxCalculateWealth()


  $(document).on 'keyup', '.budget-ammount-input', ->
    $this = $(@)
    account_id = $(@).closest('tr').find('.budget-account-select option:selected').val()

    if account_id
      ajaxCalculateWealth()

  $(document).on 'change keyup', '.budget-wunit-select, .budget-date-input ', ->
    account = $(@).closest('tr').find('.budget-account-select option:selected').val()
    ammount = $(@).closest('tr').find('.budget-ammount-input').val()
    if ammount && account
      ajaxCalculateWealth()






$(document).ready(ready)



jQuery ->
  $('#budgets').dataTable()
