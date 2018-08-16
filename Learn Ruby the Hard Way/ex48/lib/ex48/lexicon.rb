module Lexicon
  DIRECTIONS = ['north', 'south', 'east', 'west', 'down', 'up', 'left', 'right', 'back']
  VERBS = ['go', 'stop', 'kill', 'eat']
  STOP_WORDS = ['the', 'in', 'of', 'from', 'at', 'it']
  NOUNS = ['door', 'bear', 'princess', 'cabinet']

  def self.scan_word(word)
    if word.is_a? Integer
      ['number', word]
    elsif DIRECTIONS.include?(word.downcase)
      ['direction', word]
    elsif VERBS.include?(word.downcase)
      ['verb', word]
    elsif STOP_WORDS.include?(word.downcase)
      ['stop', word]
    elsif NOUNS.include?(word.downcase)
      ['noun', word]
    else
      ['error', word]
    end
  end

  def self.convert_number(object)
    begin
      Integer(object)
    rescue
      object
    end
  end

  def self.scan(sentence)
    sentence_array = sentence.split(' ')
    tuple_sentence_array = []
    sentence_array.each do |word|
      tuple_sentence_array << scan_word(convert_number(word))
    end

    tuple_sentence_array
  end
end
