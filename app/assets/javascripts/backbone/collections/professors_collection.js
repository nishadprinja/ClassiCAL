App.Collections.Professors = Backbone.Collection.extend({
	url: '/professors',
	model: App.Models.Professor,
	initialize: function() {
		console.log("New Items Collection Created");
	}
})