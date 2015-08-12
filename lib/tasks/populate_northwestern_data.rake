# require "#{Rails.root}/app/models"
require "rubygems"
require 'mechanize'
require 'pry'

# require '/Users/sonamtandinwang/Documents/General Assembly/projects/ClassiCAL/db/schema.rb'

namespace :populate_northwestern_data do

  	desc "populate all course related data from northwestern"
  	task :execute => :environment do 
  	

      	# Create a new instance of Mechanize and grab our page
      	agent = Mechanize.new  
      	page = agent.get('http://www.northwestern.edu/class-descriptions/4600/WCAS/index.html')

      	# verifying variables
      	instructors, meetingInfo, overviewOfClass, enrollmentRequirements = nil, nil, nil, nil

      	# Departments
      	class_catalogue = agent.page.links
      	class_catalogue.take(73).each_with_index do |l, count|

          	if count > 4  
              	page = l.click

              	# Department Courses
              	level_two_links = page.links
              	level_two_links.each_with_index do |m, bount|
                  	if bount > 4
                      	if m.text != "Full Site"
                          	page_two = m.click

                          	# Course Sections
                          	level_three_links = page_two.links
                          	level_three_links.each_with_index do |n, dount|
                              	if dount > 5 and n.text != "Full Site"
                                  	page_three = n.click

                                    class_name = page_three.at('h2').text

                                    # Course Information Scrape
	                                page_three.search('li').each_with_index do |la, mount|
	                                        if mount == 0 
	                                          instructors = la.text
	                                        elsif mount == 1 
	                                          meetingInfo = la.text
	                                        elsif mount == 2 
	                                          overviewOfClass = la.text
	                                        elsif mount == 3    
	                                          enrollmentRequirements = la.text
	                                        end
	                                end

		                            def split_meetin_info
		                            	# take meetingInfo Split it
		                            	# store time_end
		                            	# store time_start
		                            	# store location
		                            end    
                                # specify database
                                c = Course.new
                                c.course_name = class_name
                                c.location = meetingInfo
                                c.
                                c.save

                              	# puts class_name
                              	# puts instructors
                              	# puts meetingInfo
                              	# puts overviewOfClass
                              	# puts enrollmentRequirements
                                  
                              end
                          end
                      end
                  end
              end
          end
      end
  end
end

