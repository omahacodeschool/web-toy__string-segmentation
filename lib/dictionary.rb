
def valid_word?(word)

  dictionary = ["one", "ones", "two", "twos", "three", "threes", "open", "opening", "close", "closing", "end", "ending", "start", "starting", "connect", "connection", "reject", "rejection", "abstract", "abstraction", "affect", "affection", "trust", "trusted", "fate", "fated", "part", "parted", "walk", "walked", "cement", "cemented", "case", "casement", "base", "basement", "pave", "pavement", "love", "lovely", "care", "careful", "carefully", "origin", "original", "originally", "posit", "positive", "suggest", "suggestive", "con", "connect", "connective", "judge", "judging", "judgingly", "end", "endings", "alias", "aliases", "basements", "field", "horse", "petal", "fields", "horses", "petals", "pet", "dove", "doves", "attraction", "traction", "at", "molasses", "lasses", "cat", "cats"]
  dictionary.include?(word)
end