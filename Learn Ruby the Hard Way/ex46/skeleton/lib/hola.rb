# code for this gem is taken from https://guides.rubygems.org/make-your-own-gem/

class Hola
  def self.hi(language = "english")
    translator = Translator.new(language)
    translator.hi
  end
end

# This gets required after the class Hola is created, so that the namespacing in translator will work
require 'hola/translator'