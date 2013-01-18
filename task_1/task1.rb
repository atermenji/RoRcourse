class TimeUtils

	def week_day
		Time.new.strftime("%A")	
	end

end

# Modify method (#method_name) from class (#cls)
def modify(cls, method_name)

	if cls.send :method_defined?, method_name
		cls.send :define_method, method_name do
	  		"Your \"#{method_name}\" method was hacked!!!11"
		end
	end

end

# Add method (#method_name) to class (#cls_name) or rewrite existing one
def add(cls, method_name)

	cls.send :define_method, method_name do
  		"Your \"#{method_name}\" method was hacked!!!11"
	end

end

#========================================

time_utils = TimeUtils.new
puts "Today is : #{time_utils.week_day}"

modify(TimeUtils, "week_day")

puts "Modified : #{time_utils.week_day}"
