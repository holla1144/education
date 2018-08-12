# defining Translator within the Hola namespace makes it easilly accessible to Hola

class Hola::Translator
  def initialize(language)
    @language = language
  end

  def hi
    case @language
    when "spanish"
      "hola mundo"
    else 
      "hello world"
    end
  end
end