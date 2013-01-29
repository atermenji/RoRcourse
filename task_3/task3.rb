class NoSuchAttributeException < Exception
end

class AttributeUndefinedException < Exception
end

class Car

	@@attributes = ["engine", "size", "turbo"]

	attr_accessor :engine, :size, :turbo

	def initialize(args = nil)
		yield self if block_given?

		args.each do |k,v|
			unless @@attributes.include?("#{k}")
				raise NoSuchAttributeException.new("#{k} param does not exist" )
			end
  			instance_variable_set("@#{k}", v) unless v.nil?
		end if args.is_a? Hash
	end

	def engine_info
		raise AttributeUndefinedException.new("Engine is undefined") if @engine == nil
		raise AttributeUndefinedException.new("Size is undefined") if @size == nil
			
		return "Turbo #{@engine} engine #{@size.to_f}" if @turbo
		return "#{size.to_f} #{@engine.capitalize} engine"
	end	

end

#=================================================

a = Car.new
a.engine = :diesel
a.size = 1.6
puts "Engine : #{a.engine}"
puts "Size : #{a.size}"
puts "Engine info : #{a.engine_info}"

gas_car = Car.new(engine: :gas, size: 1.6)
puts "Gas car info : #{gas_car.engine_info}"

turbo_car = Car.new(engine: :diesel, size: 2, turbo: true)
puts "Turbo car info : #{turbo_car.engine_info}"

block_car = Car.new do |car|
	car.engine = :diesel
	car.size = 3
end
puts "Init from block : #{block_car.engine_info}"

# Car.new.engine_info		=> Engine is undefined (AttributeUndefinedException)
# Car.new(ololo: true)		=> ololo param does not exist (NoSuchAttributeException)
