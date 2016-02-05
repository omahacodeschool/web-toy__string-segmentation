def valid_word?(word)
  # Populate this array with some words of your choosing.
  dictionary = %w(one ones two twos three threes tree trees broom brooms turtle blue cat)

  if dictionary.include?(word)
    return true
  else
    return false
  end

  # Return true if your dictionary contains `word`
  # or false if it does not.
end