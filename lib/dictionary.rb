def valid_word?(word)
  # Populate this array with some words of your choosing.
  dictionary = ["turtle", "turtles", "blues", "blue", "train", "trains", "training", "trust", "trusts", "trusting", "elephant", "elephants", "waffle", "waffles", "waffling", "puzzling", "puzzles", "puzzle", "lion", "lions", "tiger", "shark", "sharks", "tigers", "bear", "bears", "tigershark", "tigersharks"]

  # Return true if your dictionary contains `word`
  # or false if it does not.
  dictionary.include?(word)

end
