# OOP Vocab

# class - tell Ruby to make a new type of thing.
# object - two meanings: the most basic type of thing, and any instance of a thing
# instance - What you get when you tell Ruby to create a class
# def - how you define a function inside of a class
# @ - inside functions in a class, @ is a variable for the instance/object being accessed
# inheritance - the concept that one class can inherit traits from another class, much like you and your parents
# composition - the concept that a class can be composed of other classes as parts, much like a car has wheels
# attribute - a property classes have that are from composition and are usually variables
# is-a - a phrase to say that something inherits from another, as in "Salmon is-a fish"
# has-a - a phrase to say that something is composed of other things or has a trait, as in "a salmon has-a mouth"

# Phrases

# class X < y  -  make a class named X that is-a Y

# class X: def initialize(J)  -  class X has-a initialize that takes a J parameter

# class X: def M(J)  -  class X has-a function named M that takes a J parameter

# foo = X.new()  -  set foo to an instance of class X

# foo.M(J)  -  from foo, get the M function, and call it with the parameter J

# foo.K = Q  -  From foo, get the K attribute, and set it to Q
