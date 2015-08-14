App.Views.Courses = Backbone.View.extend({
	el: '#courses',
	initialize: function() {
		console.log("New Collection Courses View Created");
		this.listenTo(this.collection, 'reset', this.renderAllCourses);
		this.listenTo(this.collection, 'add', this.renderCourse);
	},
	renderAllCourses: function() {
		this.collection().each(this.renderCourse, this);
	},
	renderCourse : function(model) {
		var newCourseView = new App.Views.Course({model : model});
		this.$el.append( newCourseView.el );
	}
})