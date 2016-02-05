def valid_word?(word)
  # Populate this array with some words of your choosing.
  dictionary = ["words","turtle","happy","blue","pink",
    "train","rust","trust","supper","fish","fishing","word",
    "bluebird","bird","blue","car","publish","pub","cars","swim",
    "swiming","swimingly","upper","swims","carp","shark","a",
    "at", "attraction","traction"]
  dictionary.include?(word)
  # Return true if your dictionary contains `word`
  # or false if it does not.
end