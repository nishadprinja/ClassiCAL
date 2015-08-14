App.Models.Course = Backbone.Model.extend({
	urlRoot: '/course',
	initialize: function() {
		console.log("New Model Created");
	},
	defaults: { 
		course_name: '',
		department_id: '',
		course_number: '',
		professor_id: '',
		location: '',
		day: '',
		time_start: '',
		time_end: '',
		summary: '',
		paired_course_id: '',
		completed: false
	},

	toggle: function() {
		this.get('completed') ? this.save('completed', false) : this.save('completed', true);
	}
});