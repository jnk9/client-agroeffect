// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require jquery-ui
//= require bootstrap-sprockets
//= require bootstrap-datepicker
//= require jquery.dcjqaccordion.2.7
//= require jquery.nicescroll
//= require jquery.scrollTo.min
//= require highcharts
//= require chartkick
//= require turbolinks
//= require_tree .

$(document).on('turbolinks:load', function() {

  $(function() {
      $('#nav-accordion').dcAccordion({
          eventType: 'click',
          autoClose: true,
          saveState: true,
          disableLink: true,
          speed: 'slow',
          showCount: false,
          autoExpand: true,
          classExpand: 'dcjq-current-parent'
      });
  });

  var Script = function () {

  jQuery('#sidebar .sub-menu > a').click(function () {
      var o = ($(this).offset());
      diff = 250 - o.top;
      if(diff>0)
          $("#sidebar").scrollTo("-="+Math.abs(diff),500);
      else
          $("#sidebar").scrollTo("+="+Math.abs(diff),500);
  });

  $(function() {
      function responsiveView() {
          var wSize = $(window).width();
          if (wSize <= 768) {
              $('#container').addClass('sidebar-close');
              $('#sidebar > ul').hide();
          }

          if (wSize > 768) {
              $('#container').removeClass('sidebar-close');
              $('#sidebar > ul').show();
          }
      }
      $(window).on('load', responsiveView);
      $(window).on('resize', responsiveView);
  });

  $('.fa-bars').click(function () {
      if ($('#sidebar > ul').is(":visible") === true) {
          $('#main-content').css({
              'margin-left': '0px'
          });
          $('#sidebar').css({
              'margin-left': '-210px'
          });
          $('#sidebar > ul').hide();
          $("#container").addClass("sidebar-closed");
      } else {
          $('#main-content').css({
              'margin-left': '210px'
          });
          $('#sidebar > ul').show();
          $('#sidebar').css({
              'margin-left': '0'
          });
          $("#container").removeClass("sidebar-closed");
      }
  });

  $("#sidebar").niceScroll({styler:"fb",cursorcolor:"#4ECDC4", cursorwidth: '3', cursorborderradius: '10px', background: '#404040', spacebarenabled:false, cursorborder: ''});

  $("html").niceScroll({styler:"fb",cursorcolor:"#4ECDC4", cursorwidth: '6', cursorborderradius: '10px', background: '#404040', spacebarenabled:false,  cursorborder: '', zindex: '1000'});

  jQuery('.panel .tools .fa-chevron-down').click(function () {
      var el = jQuery(this).parents(".panel").children(".panel-body");
      if (jQuery(this).hasClass("fa-chevron-down")) {
          jQuery(this).removeClass("fa-chevron-down").addClass("fa-chevron-up");
          el.slideUp(200);
      } else {
          jQuery(this).removeClass("fa-chevron-up").addClass("fa-chevron-down");
          el.slideDown(200);
      }
  });

  jQuery('.panel .tools .fa-times').click(function () {
      jQuery(this).parents(".panel").parent().remove();
  });

  $('.tooltips').tooltip();

  }();
  $('.datepicker').datepicker({
  selectMonths: true, // Creates a dropdown to control month
  selectYears: 2, // Creates a dropdown of 15 years to control year
  format: 'dd-mm-yyyy'
  });
});
