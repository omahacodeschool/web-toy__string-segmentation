
def valid_word?(str)
  dictionary = ["turtle", "blue", "train", "trust", "smiles", "birth", "five", "smile", "asset", "as"]

  return dictionary.include?(str)

  # Return true if your dictionary contains `word`
  # or false if it does not.
end