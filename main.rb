# require a class file
require_relative "pizza"
# require and import a module
require_relative "utils"
include Utils

puts "test"
puts 1.class

# variables
myvar = "this is a variable"
# string interpolation
puts "My variable is: #{myvar}"

# symbols
status = :pending
puts status == :pending # true
puts status == 'pending' # false

# arrays
list = [1, 2, 3, 4]

puts "idx @ -1: #{list[-1]}"
puts "idx @ 0: #{list[0]}"
puts "idx @ 3: #{list[3]}"
# exceeding array indices does not throw an exception; returns nil
puts "idx @ 4: #{list[45] == nil?}"

# loops
counter = 0
while counter < 10
  puts "while counter: #{counter}"
  counter += 1
end

for i in 1..5 do
  puts "(for) counter #{i}"
end

# methods must be pre-defined upstream before calling
def method(n)
  # conditionals  
  if n.zero?
    puts '(each) item is zero'
  # LOL elsif NOT elseif
  elsif n == 1
    puts "(each) item is one"
  else
    puts "(each) item is #{n}"
  end
end

[5, 4, 3, 2, 1, 0].each { |n| method(n) }

# hashes
hash = {
  'a' => 'alpha',
  'b' => 'beta',
  'g' => 'gamma',
  'd' => 'delta'
}

# printing hashes serializes them to the console
puts hash

# iterating over hashmaps
for k, v in hash do
  mytest = "qwe"
  puts "(for) key: #{k}, value: #{v}"
end

# WARNING: vars defined in a loop are acessible outside of it?? Scoping...
puts "k after loop #{k}, mytest: #{mytest}"

hash.each { |k,v| puts "(each) key: #{k}, value: #{v}"}

# method that yields to a block
def test(x,y)
  yield x
  puts "You are in the method test (#{x}, #{y})"
  yield y
end

# invoke the method with this block
# blocks are not quite like methods, and are called next to methods, such as .each (or any method)
# blocks are closures, and do not belong to an object
# you would likely use this for a callback
test(1,2) {|i| puts "You are in the block #{i}"}

# same as above, different syntax
test(3,4) do |i|
  puts "You are in the block #{i}"
end

# objects / classes
class Car
  @@numCars = 0

  def self.getNumCars
    @@numCars += 1
  end

  def initialize(make, model, color, numWheels, numDoors)
    @make = make
    @model = model
    @color = color
    @numWheels = numWheels
    @numDoors = numDoors
  end

  def has_num_doors(x)
    return x == @numDoors
  end

  def to_s
   "I am a #{@numDoors} door #{@color} car with make and model of #{@make} #{@model} and #{@numWheels} wheels"
  end
end

mav = Car.new("Ford", "Maverick", "Red", 4, 2)
puts "#{mav} - # cars: #{Car.getNumCars()}"
seb = Car.new("Subaru", "Forester", "Blue", 4, 4)
puts "#{seb} - # cars: #{Car.getNumCars()}"
ern = Car.new("Chevy", "Impala", "Grey", 4, 4)
puts "#{ern} - # cars: #{Car.getNumCars()}"


puts "Mav's car has 4 doors? #{mav.has_num_doors(4)}"
puts "Seb's car has 4 doors? #{seb.has_num_doors(4)}"
puts "Ern's car has 4 doors? #{ern.has_num_doors(4)}"

# imports
p = Pizza.new(5)
puts to_uppercase("#{p}")
