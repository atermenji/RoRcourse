class NoSuchAttributeException < Exception
end

class AttributeUndefinedException < Exception
end

class Car

  attr_accessor :engine, :size, :turbo

  def initialize(args = nil)
    yield self if block_given?

    args.each do |k, v|
      no_such_attribute!(k) unless respond_to? k.to_sym
      instance_variable_set("@#{k}", v) unless v.nil?
    end if args.is_a? Hash
  end

  def engine_info
    attribute_undefined!(:engine) if @engine == nil
    attribute_undefined!(:size) if @size == nil
        
    return "Turbo #{@engine} engine #{@size.to_f}" if @turbo
    return "#{size.to_f} #{@engine.capitalize} engine"
  end

  def no_such_attribute!(attribute)
    raise NoSuchAttributeException.new("#{attribute} param does not exist" )
  end 

  def attribute_undefined!(attribute)
    raise AttributeUndefinedException.new("#{attribute} is undefined")
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

# Car.new.engine_info       # => Engine is undefined (AttributeUndefinedException)
# Car.new(ololo: true)      # => ololo param does not exist (NoSuchAttributeException)
