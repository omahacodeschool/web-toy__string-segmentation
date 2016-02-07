require_relative '../lib/dictionary.rb'

class SplitUpStringIntoWords
	# Divide a String up into words.
	#
	# str - The String that is going to be segmented.
	#
	# Returns the Array filled with words.
	def segment_string(str)

		@word_index = Hash.new(0)
		@first_letter= 0
		@last_letter = 0

		while @last_letter <= str.length do

			if danglers?(str)
				if change_value_of_letter_variable == nil
					return nil

				else
					@last_letter = change_value_of_letter_variable
					delete_from_hash
				end
				
				if you_just_deleted_the_first_word_in_hash
					@first_letter = 0
				else 
					@first_letter = change_value_of_letter_variable
				end

			elsif !valid_word?(first_to_last_letter(str))
				@last_letter += 1

			elsif valid_word?(first_to_last_letter(str))
				@word_index[first_to_last_letter(str)] = @last_letter			
				@first_letter = @last_letter + 1
				@last_letter += 1
			end
		end
		return @word_index.keys
	end

	#Check for conditions in which there are danglers.
	#if the current collection of characters is not a word
	#AND if the current value of last_letter is the same as the value of the length of the string
	#AND if the length of the joined array is less than the length of the original string
	#
	#str - The String that is going to be acted on.
	#first_letter - The index of the current first letter from the String
	#last_letter - The index of the current last letter from the String
	#word_index - The Hash that stores a String and Integer
	#
	# Returns true or false.
	def danglers?(str)
		@last_letter == str.length && @word_index.keys.join.length < str.length
	end


	#Take the value of the previous last letter and adds one to it
	#
	# word_index - The Hash that this code is pulling the max value.
	#
	#Returns the max value of the hash and adds one to it.
	def change_value_of_letter_variable
		if @word_index.values.max == nil
			return nil
		else
			return @word_index.values.max + 1
		end
	end

	#Delete the previous word and it's value from the Hash.
	#
	# word_index - The Hash that is storing the word and it's value
	#
	#Deletes the previous word and it's value from the Hash.
	def delete_from_hash
		@word_index.delete(@word_index.max_by{|k,v| v}[0])
	end

	#If the first word of the Hash was the one that you deleted.
	#
	# word_index - The Hash that is storing the word and it's value
	#
	#Conditional stating that now the max value in the Hash is nil.
	def you_just_deleted_the_first_word_in_hash
		@word_index.values.max == nil
	end

	def first_to_last_letter(str)
		return str[@first_letter..@last_letter]
	end
end


x = SplitUpStringIntoWords.new
puts x.segment_string("heartfarttrance")

