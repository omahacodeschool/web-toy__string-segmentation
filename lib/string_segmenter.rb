require_relative 'dictionary'

class Segment
  def segment_string(str)
    i = 0 
    index = -1 
    cut = 1 
    arr = [] 
    
    
    while i < str.length
      test_word = str[index, cut]
   
      if dangler?(test_word, index, str)
        word_ejected = word_ejected(arr)

        if arr.empty?
          index = -(word_ejected.length + 1)
          cut = (word_ejected.length + 1)
          i = (word_ejected.length - 2)

        else 
          index = -(arr.join.length + word_ejected.length + 1)
          cut = (word_ejected.length + 1)
          i = (arr.join.length + word_ejected.length - 1)
        end
        
      elsif valid_word?(test_word)
        arr.unshift(test_word)
        cut = 1
        index -= 1

      else 
        cut += 1 
        index -= 1
        
      end 
      i += 1
    end 
    arr
  end 

  def dangler?(test_word, index, str)
    !valid_word?(test_word) && -(index) == str.length
  end

  def word_ejected(arr)
    word_ejected = arr.shift
    return word_ejected
  end
end