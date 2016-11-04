require './factory'

Customer = Factory.new(:name,:address,:zip) do
  def say_hello
    puts "Hello, my name is #{name}"
  end
end

joe = Customer.new('Joe Smith', '123 Maple, Town NC', 12345)


puts joe.name
puts joe['name']
puts joe[:name]
puts joe[0]

joe.say_hello

