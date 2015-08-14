module ApplicationHelper
	def format_string_data da
	    Time.use_zone("Central Time (US & Canada)") do
		    Time.zone.parse(da)
		end
  	end 
end
