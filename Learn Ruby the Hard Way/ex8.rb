# Declare a variable which contains a format for presenting 4 values
formatter = "%{first} %{second} %{third} %{fourth}"

# Print formatter with four values
puts formatter % {first: 1, second: 2, third: 3, fourth: 4}

# Print formatter with four values
puts formatter % {first: "one", second: "two", third: "three", fourth: "four"}

# Print formatter with four bools
puts formatter % {first: true, second: false, third: true, fourth: false}

# Print formatter with formatter given for each of the values in the template
puts formatter % {first: formatter, second: formatter, third: formatter, fourth:formatter}

# Prints formatter with four strings wrapped in brackets because it's multiline
puts formatter % {
    first: "I had this thing.",
    second: "That you could type up right.",
    third: "But it didn't sing.",
    fourth: "So I said goodnight"
}