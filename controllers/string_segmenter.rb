require_relative 'dictionary.rb'
require_relative 'main_controller.rb'
def segment_string(str)
  i = 0                           
  words = []    
  front = - 1
  back = 1
#                     
#The iterator is moving backwards, the sample is being taken from the end of 
#the string to the beggining, when 'sample' gets a valid word, its put into 
#  
  while i < str.length                
    sample = str[front,back]
      if valid_word?(sample)
        words << sample
        front -= 1
        back = 1
        i += 1      
#
#the 'words' array, the iterator keeps going until the last character, the #beggining of the string.  When the loop is done, it prints the collected 
#
      else
        front -= 1
        back += 1
        i += 1   
      end
  end   
#
#When the loop is done, it prints the collected words array in revserse, the 
#original order of the string.
#
return words.reverse
end
