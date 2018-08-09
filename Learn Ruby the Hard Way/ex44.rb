# Most uses of inheritance can be simplified or replaced with composition

# inheritance is when a class gets its functionality and attributes from another class

# ways in which parent/child classes can interact 
#  * Actions on the child imply an action on the parent.
#  * Actions on the child override the action on the parent.
#  * Actions on the child alter the action on the parent

# ==== IMPLICIT INHERITANCE ==== 

# class Parent
#   def implicit()
#     puts "PARENT implicit()"
#   end
# end

# class Child < Parent
# end

# dad = Parent.new()
# son = Child.new()

# dad.implicit() # PARENT implicit()
# son.implicit() # PARENT implicit()

# ==== OVERRIDE EXPLICITLY

# In this case, we overrite the parent class method override in the child
# This is used to give the child different behavior from the parent

# class Parent
#   def override()
#     puts "PARENT ovveride()"
#   end
# end

# class Child < Parent
#   def override()
#     puts "CHILD override()"
#   end
# end

# dad = Parent.new()
# son = Child.new()

# dad.override() # PARENT override()
# son.override() # CHILD override()

# ==== ALTER BEFORE OR AFTER WITH SUPER ====

# You can explcitly access parent attributes or methods with
# the built in super method. This allows a class to call its
# own version of method, then call the parent version

# class Parent
#   def altered()
#     puts "PARENT altered()"
#   end
# end

# class Child < Parent
#   def altered()
#     puts "CHILD, BEFORE PARENT altered()"
#     super()
#     puts "CHILD, AFTER PARENT altered()"
#   end
# end

# dad = Parent.new()
# son = Child.new()

# dad.altered() # PARENT altered()
# son.altered() # CHILD, BEFORE PARENT altered : PARENT altered() : CHILD, AFTER PARENT altered()

# ==== Using super() with initialize

# this is the most common use of super()

# class Child < Parent
#   def initialize(stuff)
#     @stuff = stuff # set stuff to a value specific to the child class
#     super()        # do the same initialization stuff as in the parent class
#   end
# end

# ==== COMPOSITION ====

# We can do a lot of the same stuff that we do with inheritance by just creating other classes

# 

# ==== Seperating out functionality using Modules and Mixins

# in this Module we'll extract a bunch of functionality that used to be in a class

module Other
  def override()
    puts "OTHER override()"
  end

  def implicit()
    puts "OTHER implicit()"
  end

  def Other.altered()
    puts "OTHER altered()"
  end
end

class Child
  include Other # require the Other module with an include statement

  def override()
    puts "CHILD override()"
  end

  def altered()
    puts "CHILD, BEFORE OTHER altered()"
    Other.altered()
    puts "CHILD, AFTER OTHER altered()"
  end
end

son = Child.new()
son.implicit() # this will work because we've mixed in the Other module's implicit function
son.override()
son.altered()