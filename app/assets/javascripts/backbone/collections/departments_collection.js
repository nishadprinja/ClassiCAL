App.Collections.Departments = Backbone.Collection.extend({
	url: '/departments',
	model: App.Models.Department,
	initialize: function() {
		console.log("New Items Collection Created");
	}
})