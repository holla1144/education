require_relative './sentence_class'
require_relative './lexicon'

module Parser
	# Takes a sentence and returns a
	# new sentence class
	def self.parse_sentence(sentence)
		subject, verb, object = Lexicon.scan(sentence)
		puts subject, verb, object
		Sentence.new(subject, verb, object)
	end

	class ParserError < Exception
	end

	class Sentence
		def initialize(subject, verb, object)
			@subject = subject[1]
			@verb = verb[1]
			@object = object[1]
		end

		attr_reader :subject
  	attr_reader :verb
		attr_reader :object
	end

	def peek(word_list)
		if word_list
			word = word_list[0]
			word
		else 
			nil
		end
	end

	def match(word_list, expecting)
		if word_list
			word = word_list.shift

			if word_list[0] == expecting
				word
			else
				nil
			end
		else 
			nil
		end
	end

	def skip(word_list, word_type)
		while peek(word_list) == word_type
			match(word_list, word_type)
		end
	end

	def parse_verb(word_list)
		skip(word_list, 'stop')

		if peek(word_list == 'verb')
			match(word_list, 'verb')
		else 
			raise ParserError.new('Expected a verb next.')
		end
	end

	def parse_object(word_list)
		skip(word_list, 'stop')
		next_word = peek(word_list)

		if next_word == 'noun'
			match(word_list, 'noun')
		elsif next_word == 'direction'
			match(next_word, 'direction')
		else 
			raise ParserError.new('Expected a noun or a direction next')
		end
	end

end
