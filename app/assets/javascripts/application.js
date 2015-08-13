// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery-ui.custom.min
//= require jquery_ujs
//= require turbolinks
<<<<<<< HEAD
//= require underscore
//= require backbone
//= require handlebars
//= require_self
//= require moment.min
//= require fullcalendar
//= require calendar
//= require_tree ./backbone/routers
//= require_tree ./backbone/models
//= require_tree ./backbone/collections
//= require_tree ./backbone/views
//= require_tree ./templates
//= require_tree ../../../vendor/assets/javascripts
//= require_tree .
var App = {
	Models: {}, 
	Collections: {}, 
	Views: {}, 
	Routers: {}
};
=======
//= require application.js
//= require underscore
//= require backbone
//= require collections/courses.js

var App = {
	Views: {},
	Collections: {},
	Models: {}
};

$(function(){
	console.log('luls this shit works XD')
	var courses = new App.Collections.Courses;
	courses.fetch({
		success: function (data) {
			console.log(data);
		}
	});
});
>>>>>>> 348a305d225d9bfc1d6222aa1f29b6756c77635c
