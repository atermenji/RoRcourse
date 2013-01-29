##Home work №3

###Задачи

1. Make it live

```ruby
a = Car.new ;a.engine = :diesel ; a.size = 1.6
a.engine #should return :diesel
a.size #should return 1.6
a.engine_info #should print "1.6 Diesel engine"

Car.new(:engine => :gas, :size => 1.6).engine_info
#should print "1.6 Gas engine"

Car.new.engine_info #should fail
Car.new(asdasd: true) #should fail

Car.new(engine: :diesel, size: 2, turbo: true).engine_info
#should pring "Turbo diesel engine 2.0"

a = Car.new do
    self.engine = :diesel
    self.size = 3
end
a.engine_info #prints "3.0 Diesel engine"
```