def valid_word?(word)
  # Populate this array with some words of your choosing.
  dictionary = ["one","ones","two","twos","three","threes","open","opening","close","closing","end","ending","start","starting","connect","connection","reject","rejection","abstract","abstraction","affect","affection","trust","trusted", "fate","fated", "part","parted", "walk","walked","cement","cemented","case","casement","base","basement","pave","pavement","love","lovely","care","careful","carefully","origin","original","originally","posit","positive","suggest","suggestive","con","connect","connective","judge","judging","judgingly","end","endings","alias","aliases","basements"]
  dictionary.include?(word)
  # Return true if your dictionary contains `word`
  # or false if it does not.
end