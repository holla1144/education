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

	def self.peek(word_list)
		if word_list
			word = word_list[0]
			word[0]
		else 
			nil
		end
	end

	def self.match(word_list, expecting)
		if word_list
			word = word_list.shift

			if word[0] == expecting
				word
			else
				nil
			end
		else 
			nil
		end
	end

	def self.skip(word_list, word_type)
		while peek(word_list) == word_type
			match(word_list, word_type)
		end
	end

	def self.parse_verb(word_list)
		skip(word_list, 'stop')

		if peek(word_list) == 'verb'
			match(word_list, 'verb')
		else 
			raise ParserError.new('Expected a verb next.')
		end
	end

	def self.parse_object(word_list)
		skip(word_list, 'stop')
		next_word = peek(word_list)

		if next_word == 'noun'
			match(word_list, 'noun')
		elsif next_word == 'direction'
			match(word_list, 'direction')
		else 
			raise ParserError.new('Expected a noun or a direction next')
		end
	end

	def self.parse_subject(word_list)
		skip(word_list, 'stop')
		next_word = peek(word_list)

		print next_word == 'verb'

		if next_word == 'noun'
			match(word_list, 'noun')
		elsif next_word == 'verb'
			['noun', 'player']
		else
			raise ParserError.new("Expected a verb next.")
		end
	end

	def self.parse_sentence(word_list)
		subj = parse_subject(word_list)
		verb = parse_verb(word_list)
		obj = parse_object(word_list)

		print subj
		print verb
		print obj

		Sentence.new(subj, verb, obj)
	end
end
