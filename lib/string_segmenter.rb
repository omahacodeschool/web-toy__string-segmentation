require_relative 'dictionary'

class String_Segmenter

  # Basic algorithm 
  #
  # Returns final array with segmented string.
  def segment_string

    i = 0 
    @index = -1 
    cut = 1 
    @arr = [] 

    while i < @str.length
      @test_word = @str[@index, cut]
    
      if dangler?
        @ejected_word = word_ejection
    
        if @arr.empty?
          @index = -(@ejected_word.length + 1)
          cut = (@ejected_word.length + 1)
          i = (@ejected_word.length - 2)
    
        else 
          @index = -(@arr.join.length + @ejected_word.length + 1)
          cut = (@ejected_word.length + 1)
          i = (@arr.join.length + @ejected_word.length - 1)
        end
         
      elsif valid_word?(@test_word)
        @arr.unshift(@test_word)
        cut = 1
        @index -= 1
   
      else 
        cut += 1 
        @index -= 1
         
      end 
      i += 1
    end 
    @arr
  end 

  # Checks for "danglers", or letters leftover at the end of all loops.
  #
  # Takes these methods and properties into consideraton:
  # valid_word?
  # @test_word
  # @index
  # @str
  #
  #Defines danglers as a scenario where the test_word is not a valid_word
  #the state of the index (made negative) is also equal to #the length of the original string being passed in.
  #
  #Only defines, does not return any data (other than true or false).

  def dangler?
    !valid_word?(@test_word) && -(@index) == @str.length
  end
   
  # Ejects words from the array (the purpose of which will then be to go back #and find a longer version of the word)
  #
  #Affects the arr by using the shift method.
  def word_ejection()
    @word_ejected = @arr.shift
    return @word_ejected
  end

  #used primarily for test purposes.
  #
  #Allows the string to be set to a specific value.
  def set_str(x)
    @str = x
  end

end
