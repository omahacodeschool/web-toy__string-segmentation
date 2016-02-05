#require_relative "dictionary"

class StringSegmenter

  def initialize(str)
    @arr = str.split(//)
    @letters = ""
    @collection = []
    @range_right = 1
    @temp_storage = []
    @count_left = 0   
  end

  def run_segmenter
 
    while @range_right < @arr.length

      set_numbers_string

      if valid_word?(@letters) == true
        push_letters_into_tempstorage
        clear_letters_string 
        set_var_n

        while @n < @arr.length
          set_double_check 
          if valid_word?(@double_check) == true
            clear_tempstorage
            doublecheck_to_tempstorage
          end
          @n += 1
        end

        move_temp_storage_to_permanent_storage
        set_range_to_length_of_collection
        set_count_to_range
      else
        increment_range_right   
      end

    end
    @collection.join(", ")   
  end


  #segment_string("swimbluebirdtrustswiminglybluesharkattraction")

#Define methods here

  #Add 1 to range_right Integer

  #Affects: '@range_right'

  #Returns new Integer value for '@range_right' variable
  def increment_range_right
    @range_right += 1
  end

  #Sets the '@count_left' Integer to the value of '@range_right'

  #Affects: '@count_left'

  #Returns new Integer value for '@count_left' variable
  def set_count_to_range
    @count_left = @range_right
  end

  #Sets '@range_right' Integer to the length of characters in the
  #'@collection' Array

  #Affects: '@range_right'

  #Returns new Integer value for '@range_right' variable
  def set_range_to_length_of_collection
    @range_right = @collection.join.length
  end

  #Pushes whatever is in the '@temp_storage' array into '@collection' Array

  #Affects: '@collection'

  #Returns new Array for '@collection'
  def move_temp_storage_to_permanent_storage
    @collection << @temp_storage.pop
  end

  #Modifies 'letters' String so it can be tested against dictionary

  #Affects: '@letters'

  #Returns String of characters 
  def set_numbers_string
    @letters = @arr[@count_left..@range_right].join
  end

  #If '@letters' tests positive as a word, push those characters into
  #a temporary storage Array.

  #Affects: '@temp_storage'

  #Returns new value for '@temp_storage' Array
  def push_letters_into_tempstorage
    @temp_storage << @letters
  end

  #Like the name says, just sets '@letters' to an empty String

  #Affects: '@letters'

  #Returns variable '@letters'
  def clear_letters_string
    @letters=""
  end

  #Creates new Variable called '@n' and sets it to the value of 
  #current value of '@range_right'

  #Affects: '@n'

  #Returns Integer '@n'
  def set_var_n
    @n = @range_right + 1
    return @n
  end

  #After a word has been found and put into '@temp_storate'. Create a 
  #String of characters called '@double_check'.  These character
  #are then checked against dictionary to determine if there are any
  #variations of the word that was found.

  #Returns String '@double_check'
  def set_double_check
    @double_check = @arr[@count_left..@n].join
    return @double_check
  end

  #Like the name says, just sets '@temp_storage' to an empty Array

  #Affects: '@temp_storage'

  #Returns Array '@temp_storage'
  def clear_tempstorage
    @temp_storage = []
  end

  #If the String '@double_check' tests positive against dictionary.  
  #Push the current String of characters into '@temp_storage'

  #Affects: '@temp_storage'

  #Returns Array '@temp_storage'
  def doublecheck_to_tempstorage
    @temp_storage << @double_check
  end
  
end














