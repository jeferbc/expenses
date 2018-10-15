# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org
class Charts
  constructor:() ->
    $(document).on("turbolinks:load", @last_six_months);
    $(document).on("turbolinks:load", @by_day);
    $(document).on("turbolinks:load", @by_category);
    $(document).on("turbolinks:load", @acum);

  last_six_months:() =>
    $.ajax '/dashboard/last_six_months.json',
      type: 'GET'
      dataType: "json"
      success: (data, textStatus, jqXHR) =>
        chart = new CanvasJS.Chart("last_six_months",
          title:{
		          text: "Últimos seis meses"
	        },
          backgroundColor: '#848484',
          animationEnabled: true,
          data: data
        )
        chart.render();

  by_day:() =>
      $.ajax '/dashboard/by_day.json',
        type: 'GET'
        dataType: "json"
        success: (data, textStatus, jqXHR) =>
          chart = new CanvasJS.Chart("by_day",
            title:{
  		          text: "Gastos del día"
  	        },
            backgroundColor: '#848484',
            animationEnabled: true,
            data: data
          )
          chart.render();

  by_category:() =>
      $.ajax '/dashboard/by_category.json',
        type: 'GET'
        dataType: "json"
        success: (data, textStatus, jqXHR) =>
          chart = new CanvasJS.Chart("by_category",
            title:{
  		          text: "Categorías"
  	        },
            backgroundColor: '#848484',
            animationEnabled: true,
            data: data
          )
          chart.render();

  acum:() =>
      $.ajax '/dashboard/acum.json',
        type: 'GET'
        dataType: "json"
        success: (data, textStatus, jqXHR) =>
          chart = new CanvasJS.Chart("acum",
            title:{
  		          text: "Acumulado"
  	        },
            backgroundColor: '#848484',
            animationEnabled: true,
            data: data
          )
          chart.render();

window.Charts = Charts
