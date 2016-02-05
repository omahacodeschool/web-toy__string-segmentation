require_relative "dictionary"

def segment_string(str)
  puts "BEGINNING STRING SEGMENTATION FOR '#{str}'"
  len = str.length
  i_last_real_word = 0
  i = 0
  skip_counter = 0
  $words = Hash.new
  puts "Looping through each character in '#{str}'..."

  while i <= len do
    puts "\n-------"
    puts "Checking letters '#{i_last_real_word}' until '#{i}'"
    prefix = str[i_last_real_word...i]
    puts "Is '#{prefix}' a word?"
    if valid_word?(prefix)
      puts "Yes."
      puts "Adding '#{prefix}' to our collection of words."
      if skip_counter > 0
        puts "\nBut SKIP is in effect, so we will remove '#{prefix}' from our collection of words"
        puts "Now disabling SKIP so that the next word is added"
        skip_counter -= 1
      else
        $words[i] = prefix
        puts $words
        i_last_real_word = i
      end
    end

    if dangler?(i, len, prefix)
      puts "\nDANGLER! DANGLER!"
      puts "\nWe're at the end of the String, but '#{prefix}' is NOT a word."
      puts "The last word we added should NOT have been added."
      puts "We need to remove that word from our collection."
      delete_last_word # this is a Hash
      new_last_word_index = last_word_index # this is an Integer or nil
      if new_last_word_index.nil?
        puts "\nRemoving the last word emptied our collection."
        puts "So we will start again from the beginning"
        i_last_real_word = 0
        i = 0
      else
        i_last_real_word = new_last_word_index
        puts "We should start again from character number #{i_last_real_word}"
        i = i_last_real_word
      end
      puts "SKIP is now in effect!"
      skip_counter += 1
    end
    # if no danglers exist, continue to next letter
    i += 1
  end

  return $words.values

end


# Defines if danglers exist
#
# i - Integer value of the current character we are looking at
# len - Integer value of the length of the String we are testing
# prefix - String representing the remaining letters
#
# Example: (14, 14, jibberish)
# => true
#
# Example: (14, 14, word)
# => false
#
# Example: (13, 14, jibberish)
# => false
#
# Returns a Boolean of true/false
def dangler?(i, len, prefix)
  (i == len) && !valid_word?(prefix)
end


# Defines how to delete the key-value pair and return the value from $words whose key is equal to (last_word_index)
#
# Example:
# words = {4=>"ones", 8=>"twos", 14=>"threes"}
# last_word_index = 14
# words.delete(14) => "threes"
# words = {4=>"ones", 8=>"twos"}
#
# Returns a Hash
def delete_last_word
  $words.delete(last_word_index)
  puts "So now we just have '#{$words}' in our collection."
  puts "We need to rewind and start searching for words again."  
end


# 1. Returns a new Array populated with the keys from $words
# 2. Returns an Integer for the last value of that Array.
# If the Array is empty, returns nil.
#
# Example:
# words = {4=>"ones", 8=>"twos", 14=>"threes"}
# words.keys => [4, 8, 14]
# words.keys.last => 14
#
# Returns an Integer or nil
def last_word_index
  $words.keys.last
end

# segment_string("onetwothree")
# segment_string("onestwosthrees")
# segment_string("treesbrooms")










