require "rubygems"
require 'mechanize'
require 'pry'
require "#{Rails.root}/app/helpers/application_helper"
include ApplicationHelper

namespace :populate_northwestern_data do

  desc "populate all course related data from northwestern"
  task :execute => :environment do 

        # CREATING A NEW INSTANCE OF MECHANIZE
        # ESTABLISHING HOME PAGE FOR MECHANIZE
        agent = Mechanize.new  
        page = agent.get('http://www.northwestern.edu/class-descriptions/4600/WCAS/index.html')

        # VERIFYING VARIABLES (IDK WHY DOE)
        instructors, meetingInfo, overviewOfClass, enrollmentRequirements = nil, nil, nil, nil

        # DEPARTMENTS
        class_catalogue = agent.page.links
        class_catalogue.take(73).each_with_index do |l, count|

            if count > 4  
                page = l.click

                # DEPARTMENT>COURSES
                level_two_links = page.links
                level_two_links.each_with_index do |m, bount|
                    if bount > 4
                        if m.text != "Full Site"
                            page_two = m.click

                            # DEPARTMENT>COURSE>SECTIONS
                            level_three_links = page_two.links
                            level_three_links.each_with_index do |n, dount|
                                if dount > 5 and n.text != "Full Site"
                                    page_three = n.click

                                    # SCRAPING COURSE INFO 1 (FROM PAGE)
                                    class_name = page_three.at('h2').text
                                    department = level_three_links[4].text
                                course_num = level_three_links[5].text

                                    # SCRAPING COURSE INFO 2 (FROM <li>)
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

                                    # SPLITTING meetingInfo INTO BITS
                                    new_location = meetingInfo.split
                      days = new_location[-4]
                      ttime_start = new_location[-3]
                      ttime_end = new_location[-1]  
                        actual_location = new_location
                        actual_location.slice!(-5..-1)
                        geo_location = actual_location.join(' ')
                        geo_location

                                # SHOVING INTO DATABASE // COURSES
                                if !class_name.downcase.include?("chinese") and !class_name.downcase.include?("hindi")
                                  c = Course.new
                                  c.course_name = class_name
                                  c.course_number = course_num
                                  c.professor = instructors
                                  c.location = geo_location
                                  c.day = days
                                  puts class_name 
                                  puts ttime_start
                                  puts ttime_end

                                  if ttime_start
                                    c.time_start = format_string_data(ttime_start)
                                  end

                                  if ttime_end
                                    c.time_end = format_string_data(ttime_end)
                                  end

                                  c.summary = overviewOfClass
                                  c.save

                                  # SHOVING INTO DATABASE // DEPARTMENTS
                                  d = Department.new 
                                  d.department_name = department
                                  d.save
                                end

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