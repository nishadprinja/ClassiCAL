App.Collections.Courses = Backbone.Collection.extend ({
	initialize: function () {
		console.log("Courses collection is good")
	},
	url: '/courses'
});