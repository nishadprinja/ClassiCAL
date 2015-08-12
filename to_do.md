1. to do: make join table between professors and courses (course_professors) CREATED
	prof_id
	course_id 
course.rb model won't work otherwise (has_many :professors)
	join table will have a model
	professors are going to have many courses through this join table and model has to represent that 

2. rename prerequisite_id in prerequisites table to linked_course_id
	won't be using it in models but will be calling it.

not every model has to have a controller