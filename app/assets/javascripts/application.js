//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require bootstrap

$('.budget a.title').on('click', function(e) {
  e.preventDefault();
  $('.budgets').toggle('hide');
});
