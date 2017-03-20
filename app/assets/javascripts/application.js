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
//= require bootstrap-sprockets
//= require jquery_ujs
//= require jquery-ui
//= require turbolinks
//= require bootstrap/alert
//= require bootstrap/dropdown
//= require masonry/jquery.masonry
//= require_tree .
//= require toastr

//= require bootstrap/carousel

//= require social-share-button
//= require social-share-button/wechat


$(document).ready(function() {
  $('#myCarousel').carousel({interval: 2000});

});

function msg_show(type, msg, title) {
  toastr.options = {
  closeButton: true,
  progressBar: true,
  // positionClass: "toast-top-center",
  showEasing: "swing",
  hideEasing: "linear",
  showMethod: 'fadeIn',
  hideMethod: "fadeOut",
  tapToDismiss: false,
  timeOut: 8000
  };
  toastr[type](msg, title);

}
