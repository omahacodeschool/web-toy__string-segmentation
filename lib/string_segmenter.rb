require_relative 'dictionary'

class Segmentation

  # returns position to re-begin string iteration
  #
  # wordHash - Hash to be processed
  #
  # Example:
  #
  # find_restart_value({"apple"=>100, "banana"=>200})
  # => 201
  #
  # returns position as Integer after end of most recently added word in Hash
  def find_new_i_from_prev_word
    if @wordHash.max_by { |k,v| v } == nil #deleted only word in hash
      startHereValue = 0
    else #already other word in hash
      startHere = @wordHash.max_by { |k,v| v }
      startHereValue = startHere[1] + 1
      puts "startHereValue value is #{startHereValue}"
    end
    @i = startHereValue
    return @i
  end

  # returns hash keys as array
  #
  # wordHash - Hash to be converted
  #
  # Example:
  #
  # final_hash_to_string({"a"=>100, "b"=>200})
  # => [a, b]
  #
  # returns the Array of Hash keys
  def return_final_array
    puts "reached end of string"
    @finalArray = @wordHash.keys
    puts "finalArray is #{@finalArray}"
    return @finalArray
  end

  # sets initial values to 0 or nil
  #
  # returns empty Array, Hash, and iterator/skip counter set to 0
  def set_initial_values
    @collect = []
    @wordHash = {}
    @i = 0
    @skip_counter = 0
  end

  # splits String by letter
  #
  # returns Array with each letter in an element
  def split_string
      @str = @str.split('')
  end

  # checks position of iterator in String
  #
  # returns true if end of String hasn't been reached
  def mid_string?
    @i < @str.length
  end

  # moves one letter at a time to the collection Array
  #
  # returns String of current Array contents
  def one_letter_to_collection_array
    @collect.push(@str[@i])
    @word = @collect.join('')
  end

  # empties collection Array
  #
  # returns Array with value nil
  def empty_collection_array
    @collect = []
  end

  # turns on skip counter
  #
  # returns skip_counter variable set to 1
  def skip_counter_on
    @skip_counter = 1
  end

  # turns off skip counter
  #
  # returns skip_counter variable set to 0
  def skip_counter_off
    @skip_counter = 0
  end

  # checks whether skip_counter is turned on
  #
  # returns true if skip_counter is on
  def check_skip_counter
    @skip_counter == 1
  end

  # adds one to iterator variable
  #
  # returns new value of iterator variable
  def add_one_to_iterator
    @i += 1
  end

  # adds collection Array to Hash
  #
  # returns Hash with key == word and value == last letter's position
  def add_word_to_hash
    @wordHash[@word] = @i
  end

  # checks whether iterator is at last letter in String
  #
  # returns true if iterator is at last letter
  def reached_end_of_string?
    @i >= @str.length
  end

  # deletes most recently added word from Hash
  #
  # returns Hash without most recently added word
  def delete_final_word
    finalWord = @wordHash.max_by { |k, v| v }
    finalWordKey = finalWord[0]
    @wordHash.delete(finalWordKey)
    return @wordHash
  end

  def set_segment_test_vars(x)
    @str = x
  end


  # returns string of letters as array of contained words
  # 
  # str - String to be split
  # 
  # Example:
  # 
  # "turtlebluetraintrust"
  # => ["turtle", "blue", "train", "trust"]
  #
  # Returns an Array consisting of dictionary words
  def run_through_segmentation(sample_input)
    sample_input = @str
    set_initial_values
    split_string

    while mid_string? == true do
      one_letter_to_collection_array

      if valid_word?(@word) == true
        if check_skip_counter == true
          add_one_to_iterator
          skip_counter_off
          next
        else
          add_word_to_hash
          empty_collection_array
          add_one_to_iterator
        end

      else
        add_one_to_iterator

        if reached_end_of_string? == true
          empty_collection_array
          skip_counter_on

          delete_final_word
          find_new_i_from_prev_word
        end
      end
        
    end
    return_final_array
  end

end