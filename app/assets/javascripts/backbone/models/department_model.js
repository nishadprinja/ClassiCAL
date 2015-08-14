App.Models.Department = Backbone.Model.extend({
	urlRoot: '/departments',
	initialize: function() {
		console.log("New Model Created");
	},
	defaults: { 
		department_name: ''
	},

	toggle: function() {
		this.get('completed') ? this.save('completed', false) : this.save('completed', true);
	}
});