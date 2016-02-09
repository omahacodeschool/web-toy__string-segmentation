# compare String of characters passed in from segment_string to see if it's a
# valid word
#
# if valid word, valid_word? evaluates to True
#
# if not valid word, valid_word? evaluates to False
#
def valid_word?(word)

  dictionary = ["a","that","hat","hats","hate","hates","hater","haters","hating","part","parts","parted","parting","partings","apart","apartment","apartments","base","bases","based","basement","basements","basing","cap","caps","capping","cappings","cape","capes","scape","scapes","caper","capers","caption","captions","captioning", "captioned", "can","cans","scan","scans","cane","canes", "caned", "art","arts","speak","speakers","speaks","speaker","this","word","words","or","die","ersats","sword","swords","submarine","rationalize","rationalizes"]

  dictionary.grep(word).any?
end