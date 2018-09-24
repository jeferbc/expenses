# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org
class Charts
  constructor:() ->
    $(document).on("turbolinks:load", @last_six_months);

  last_six_months:() ->
    $.ajax '/dashboard/last_six_months.json',
      type: 'GET'
      dataType: "json"
      success: (data, textStatus, jqXHR) ->
        chart = new CanvasJS.Chart("last_six_months",
          backgroundColor: '#848484',
          data: data
        )
        chart.render();

window.Charts = Charts

# class Charts
#   constructor:() ->
#     $(document).on("turbolinks:load", @by_day);
#
#   today:() ->
#     $.ajax '/dashboard/by_day.json',
#       type: 'GET'
#       dataType: "json"
#       success: (data, textStatus, jqXHR) ->
#         chart = new CanvasJS.Chart("by_day",
#           backgroundColor: '#848484',
#           data: data
#         )
#         chart.render();
#
# window.Charts = Charts
