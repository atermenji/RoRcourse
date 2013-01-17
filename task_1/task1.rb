class TimeUtils

	@@days = [
		"Sunday",
		"Monday",
		"Tuesday",
		"Wednesday",
		"Thursday",
		"Friday",
		"Saturday"
	]

	def week_day
		time = Time.new
		return @@days[time.wday]	
	end

end

# Modify method (#method_name) from class (#cls_name)
def modify(cls_name, method_name)

	cls_name.class.send :define_method, method_name do
  		return "Your \"#{method_name}\" method was hacked!!!11"
	end

end

#=======================================

time_utils = TimeUtils.new
puts "Today is : #{time_utils.week_day}"

modify(time_utils, "week_day")

puts "Modified : #{time_utils.week_day}"
