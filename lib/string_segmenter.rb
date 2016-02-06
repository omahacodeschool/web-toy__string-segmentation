require_relative 'dictionary'

# Split input string into array
#
# Returns Array of letters in input string as instance variable

def split_string_to_array(str)
  @string_as_array = str.split('')
  return @string_as_array
end

# Sets instance variable @lettercollection to empty array
#
# Returns empty Array @lettercollection

def initialize_lettercollector_array
  @lettercollection = []
  return @lettercollection
end
 

# Sets instance variable @wordstore to empty Hash
#
# Returns empty Hash @wordstore

def initialize_wordstore_hash
  @wordstore = {}
  return @wordstore
end


# Start i at 0, @wordhash as empty hash, @lettercollection as empty array
# start skip_counter at 0
#

def initialize_variables
  declare_i(0)
  initialize_lettercollector_array
  initialize_wordstore_hash
  declare_skip_counter(0)
end

#Define i as instance variable
#
#Return @i

def declare_i(x)
    @i = x
end

# Define skip_counter as instance variable
#
# Return @skip_counter

def declare_skip_counter(x)
  @skip_counter = x
end


# pushes letters from array into empty array and joins them into string
#
# Returns String (used to test and see if word)

def get_word
  @lettercollection.push(@string_as_array[@i])
  @lettercollection.join('')
end

def segment_string(str)
  
  initialize_variables


  while @i < split_string_to_array(str).length do
    
    @word = get_word



    if valid_word?(@word) == true
      if @skip_counter == 1
        @i += 1
        @skip_counter = 0
        next
      else
        @wordstore[@word] = @i
        @lettercollection = []
        @i += 1
      end

    else

      @i += 1
      if @i >= @string_as_array.length
        @lettercollection = []
        @skip_counter = 1
        lastword = @wordstore.max_by { |k, v| v }
        lastwordkey = lastword[0]
        @wordstore.delete(lastwordkey)

        if @wordstore.max_by { |k, v| v } == nil
            startpointvalue = 0
          else 
            startpoint = @wordstore.max_by { |k,v| v }
            startpointvalue = startpoint[1] + 1
          end
          @i = startpointvalue
        end
      end
    end

    result_array = @wordstore.keys
    return result_array
end
