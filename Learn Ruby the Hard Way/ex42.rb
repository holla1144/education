# Animal is-a object look at the extra credit
class Animal
  def initialize(name, sound)
    @name = name
    @sound = sound
  end

  def sayHello()
    puts "#{@sound}! My name is #{@name}"
  end
end

# Class Dog is-a Animal
class Dog < Animal
  # Class Dog has-a initialize function that takes a name parameter
  def initialize(name, sound)
    super(name, sound)
  end

  def growl()
    puts "Grrrrrrr"
  end
end

# Class Cat is-a Animal
class Cat < Animal
  # class Cat has-a initialize function that takes a name parameter
  def initialize(name, sound)
    super(name, sound)
  end

  def purr()
    puts "Purrrrrr"
  end
end

# Person is-a class
class Person
  # class Person has-a initialize function that takes a name parameter
  def initialize(name)
    @name = name
  end

  # Person has-a pet of some kind

  @pet = nil

  attr_accessor :pet # attr_accessor allows us to read and write values to pet
end

# Employee is-a Person
class Employee < Person

  def initialize(name, salary)
    # Super lets you get the name argument and functionality from the parent class
    super(name)
    # person has-a initialize function with name and salary parameters
    @salary = salary
  end
end

# Fish is a class
class Fish
end

# Salmon is-a Fish
class Salmon < Fish
end

# Halibut is-a Fish
class Halibut < Fish
end

# rover is-a dog
rover = Dog.new("Rover", "Woof!")

# satan is-a cat
satan = Cat.new("Satan", "Meow")

rover.sayHello()
satan.sayHello()
rover.growl()
satan.purr()

# mary is a person
mary = Person.new("Mary")

# mary has-a pet named satan: we're setting an object as the value of an attribute of an object
mary.pet = satan

# frank is-a employee
frank = Employee.new("Frank", 120000)

# frank has-a pet named rover
frank.pet = rover

# flipper is a fish
flipper = Fish.new()

# crouse is a salmon
crouse = Salmon.new()

# harry is a halibut
harry = Halibut.new()
