// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require rails-ujs
//= require jquery
//= require activestorage
//= require turbolinks
//= require_tree .


document.addEventListener('turbolinks:load', function(){
  $("input.search").on('input', ({target: {value}}) => {
    if(!value || value.length == 0) {
      $(".search-results").addClass('is-hidden')
      return
    }
    $.ajax({
      url: `/player/search/${value}`,
      success: function(results) {
        resultHTML = ""
        results.map(result => {
          resultHTML += `
            <li id="${result.id}">
              <a href="/player/show/${result.id}">
                <span class="name">${result.name}</span>
                •
                <span class="club">${result.club || "No Club"}</span>
                •
                <span class="nationality">${result.nationality}</span>
                •
                <span class="goals">${result.goals} Goals</span>
                •
                <span class="age">${result.age} Yrs Old</span>
              </a>
            </li>`
        })
        if(resultHTML === "")
          resultHTML = "<li><a href='#'>No Results Found</a></li>"
        $('.search-results ul').html(resultHTML)
        $(".search-results").removeClass('is-hidden')
      }
    })
  })
})
