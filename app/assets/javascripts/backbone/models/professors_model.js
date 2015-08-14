App.Models.Professor = Backbone.Model.extend({
	urlRoot: '/professors',
	initialize: function() {
		console.log("New Model Created");
	},
	defaults: { 
		name: '',
		overall_quality: '',
		average_grade: '',
		helpfulness: '',
		clarity: '',
		easiness: '',
		student_rating: ''
	},

	toggle: function() {
		this.get('completed') ? this.save('completed', false) : this.save('completed', true);
	}
});