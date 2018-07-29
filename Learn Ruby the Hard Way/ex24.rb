puts "Let's practice everything."
puts 'You\'d need to know \'bout escapes with \\ that do \n newlines and \t tabs.'

# the <<END is a "heredoc." See the Student Questions.

# Here doc tells ruby to write everything until the keyword into the variable poem
poem = <<LEMON
\tThe lovely world
with logic so firmly planted
cannot discern \n the needs of love
nor comprehend passion from intuition
and requires an explanation
\n\t\twhere there is none.
LEMON

puts "------------"
puts poem
puts "------------"

five = 10 - 2 + 3 -6
puts "This should be five: #{five}"

def secret_formula(started)
    jelly_beans = started * 500
    jars = jelly_beans / 1000
    crates = jars / 100
    return jelly_beans, jars, crates # we need return to return multiple variables
end

start_point = 10000
beans, jars, crates = secret_formula(start_point)

puts "With a starting point of: #{start_point}"
puts "We'd have #{beans} beans, #{jars} jars, and #{crates} crates."

start_point = start_point / 1000
puts "We can also do that this way:"
# We use destructuring to assign the three return values of secret formula to % variables
puts "We'd have %s beans, %d jars, and %d crates." % secret_formula(start_point)