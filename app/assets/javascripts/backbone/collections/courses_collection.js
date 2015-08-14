App.Collections.Courses = Backbone.Collection.extend({
	url: '/courses',
	model: App.Models.Course,
	initialize: function() {
		console.log("New Items Collection Created");
	}
})