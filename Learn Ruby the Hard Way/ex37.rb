# VOCAB

# BEGIN - designates a codeblock to be run unconditionally before the sequential execution of the program
# END - designates a codeblock to be run just before a program terminates
# alias - assigns another name to a method. The original method name will still work
# and (not &&) - boolean operator that has lower priority than &&. They also have different evaluation rules
# begin - start of something called a begin block. Typically used to scope exception/rescue operations
# break - terminates a while or until loop immediately. Accepts argument that will be returned after the break occurs
# case - statement operator that is usually followed by a bunch of when clauses. LIke the JS switch. 
# def - defines a new function
# defined? - checks if a given entity has already been defined: works for assignments, methods, classes
# do - often used in loops to delimit the beginning of the code block to be executed. 
# else - block of code to be run if no earlier predicates are satisfied
# elsif - used in an if block to indicate a predicate that comes after the first "if" but before the "else" block
# end - indicates the end of functions, classes, modules, and just about everything else
# ensure - the final, optional clause of the begin/end block that indicates a chunk of code to be run even if there's an exception
# for - indicates the start of a for..in loop, which is considered less preferable than .each
# if - defines first predicate in an if/else code block
# in - used in for..in loops. For initializes a local variable to be used in the code block for each element IN an array
# module - creates a new module scope block. All variables within the module block are local to the module. Self represents the module
# next - used within a loop (until, while, each) to unconditionally skip to the next execution of that block
# not - logical not - best to use ! instead
# or - logical or. Best to use || instead
# redo - causes unconditionally rerun of the same codeblock with exactly the same bindings
# rescue - indicates an exception handling clause. This can be in a program or in a method definition. 
# retry - used inside of rescue blocks. Will call the code we initially attempted to run
# return - ends a method and returns a value. If multiple values are returned, they will be returned in an array. The default value of return is nil
# self - references the current object, be it module, class, or method
# super - called within a method, looks for a method with the same name in parent class or parents of parent class
# then - optionally used in if statments to return something if the predicate is true
# undef - undefines a given method
# unless - logical operator that's basically the opposite of if
# until - inverse of while. Indicates that a block of code will be executed so long as a given predicate is not true
# when - used in case blocks to introduce predicates that the value assigned to case will be compared against
# while - beginning of a while loop. 
# yield - called from inside of a method, it 'yields' control to a block of code provided as part of the method call

# number - data type: integer
# float - data type: decimal

# .. - used in a range to indicate the bounds are inclusive. That is range(1..5) will include 5
# ... - used in a range to indicate the bounds are exclusive. range(1...5) will end with 4
# @ - indicates object scope
# @@ - indicates class scope
# $ - indicates global scope