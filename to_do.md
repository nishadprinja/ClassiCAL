
fix the columns with null values in schema.rb file
fix id's


1. put in rake task
def format_string_date da
        Time.use_zone(current_user.detail.time_zone) do
          Time.zone.parse(da).strftime("%A, %b %d")
        end
    end

that is what I wrote to
parse a string into a datetime
instead of current_user.detail.time_zone
do the central time zone

which i have to find
and 'da' is the time string
that you want to turn into a time



 to do: make join table between professors and courses (course_professors) CREATED
	prof_id
	course_id 
course.rb model won't work otherwise (has_many :professors)
	join table will have a model
	professors are going to have many courses through this join table and model has to represent that 

2. rename prerequisite_id in prerequisites table to linked_course_id
	won't be using it in models but will be calling it.

not every model has to have a controller


need to tell sessions that user is a google user
	need to store info about google user in the user session


THURSDAY DONE:
changed datetime to string
deleted rachelle.md file


(to scrape data from NU website
 Run this to rake the scrape in the comand line:
rake populate_northwestern_data:execute)