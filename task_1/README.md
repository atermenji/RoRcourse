##Home work №1

###Задачи

1. Вызов метода должен печатать соот. день недели
```today #=> monday or tuesday or etc```
2. Написать метод, модифицирующий другой метод данного класса:

```ruby
class A
def to_modify
  puts "print from not modified method"
end
end
A.new.to_modify #=> "print from not modified method"
modify( A ) #=> it should modify class A to this
A.new.to_modify #=> "print from modified method, yeah!!!"
```