require_relative 'dictionary'

class StringSegmentor

  #Sets instance variables
  def set_instance_variables
    @i_last_real_word = 0
    @i = 0
    @skip_counter = 0
    @words = {}
  end

  #Passes each character into prefix starting for [0]
  def set_prefix
    @prefix = @str[@i_last_real_word...@i]
  end

  def disable_skip_counter
    @skip_counter -= 1
  end

  def delete_last_word
    last_word_index = @words.keys.sort.last
    @words.delete(last_word_index)
  end  

  def collect_words
    @words[@i] = @prefix
  end

  def advance_start_index
    @i_last_real_word = @i
  end

  def reset_index
    @new_last_word_index = @words.keys.sort.last
  end

  def enable_skip_counter
    @skip_counter += 1
  end

  def start_loop_from_beginning
    @i_last_real_word = 0        
    @i = 0
  end

  def start_end_of_last_word
    @i_last_real_word = @new_last_word_index
    @i = @i_last_real_word
  end

  def segment_string(str)
    
    @str = str
    len = @str.length
    set_instance_variables
    
    while @i <= len do
      set_prefix
      
      if valid_word?(@prefix)
        if @skip_counter > 0
          disable_skip_counter
        else
          collect_words
          advance_start_index
        end
      end

      
      if (@i == len) && !valid_word?(@prefix)
        delete_last_word
        reset_index

        if @new_last_word_index.nil?
          start_loop_from_beginning
        else
         start_end_of_last_word
        end
        enable_skip_counter
      end

      @i +=1
    end
    
    return @words.values
  end
end