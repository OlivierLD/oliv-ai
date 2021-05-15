from nltk.tokenize import sent_tokenize, word_tokenize

DRAW_TREES = False
#
# Tokenizing
#
print("\nTokenizing\n")

example_string = """Muad'Dib learned rapidly because his first training was in how to learn.
And the first lesson of all was the basic trust that he could learn.
It's shocking to find how many people do not believe they can learn,
and how many more believe learning to be difficult."""

print(f"Processing {example_string}")

sentences = sent_tokenize(example_string)
print(f"Sentences: {sentences}")

words = word_tokenize(example_string)
print(f"Words: {words}")

#
# Filtering Stop Words
#
print("\nFiltering\n")

import nltk
nltk.download("stopwords")
from nltk.corpus import stopwords
from nltk.tokenize import word_tokenize

worf_quote = "Sir, I protest. I am not a merry man!"
words_in_quote = word_tokenize(worf_quote)

print(words_in_quote)
# ['Sir', ',', 'protest', '.', 'merry', 'man', '!']

stop_words = set(stopwords.words("english"))
filtered_list = []
for word in words_in_quote:
    if word.casefold() not in stop_words:
        filtered_list.append(word)

print(f"V1: {filtered_list}")
# ['Sir', ',', 'protest', '.', 'merry', 'man', '!']

filtered_list = [
    word for word in words_in_quote if word.casefold() not in stop_words
]
print(f"V2: {filtered_list}")

#
# Stemming
#
print("\nStemming\n")

from nltk.stem import PorterStemmer
from nltk.tokenize import word_tokenize

stemmer = PorterStemmer()

string_for_stemming = """The crew of the USS Discovery discovered many discoveries.
Discovering is what explorers do."""

words = word_tokenize(string_for_stemming)
print(words)

stemmed_words = [stemmer.stem(word) for word in words]
print(stemmed_words)

#
# Tagging Parts of Speech
#
print("\nTagging\n")

sagan_quote = """If you wish to make an apple pie from scratch,
you must first invent the universe."""

words_in_sagan_quote = word_tokenize(sagan_quote)
pos_tag = nltk.pos_tag(words_in_sagan_quote)

print("+----------------------+------------+")
print("| Tags that start with | Deal with  |")
print("+----------------------+------------+")
print("| JJ                   | Adjectives |")
print("| NN                   | Nouns      |")
print("| RB                   | Adverbs    |")
print("| PRP                  | Pronouns   |")
print("| VB                   | Verbs      |")
print("+----------------------+------------+")

print("\nCarl Sagan:")
# print(pos_tag)
for one in pos_tag:
    print(one)


jabberwocky_excerpt = """'Twas brillig, and the slithy toves did gyre and gimble in the wabe:
all mimsy were the borogoves, and the mome raths outgrabe."""

words_in_excerpt = word_tokenize(jabberwocky_excerpt)
jbw = nltk.pos_tag(words_in_excerpt)
print("\nJabberwocky:")
# print(jbw)
for one in jbw:
    print(one)

#
# Lemmatizing
#
print("\nLemmatizing\n")

from nltk.stem import WordNetLemmatizer
lemmatizer = WordNetLemmatizer()

plural = "scarves"
lemm = lemmatizer.lemmatize(plural)
print(f"{plural} => {lemm}")

string_for_lemmatizing = "The friends of DeSoto love scarves."
words = word_tokenize(string_for_lemmatizing)
lemmatized_words = [lemmatizer.lemmatize(word) for word in words]

print(words)
print(lemmatized_words)

worst = "worst"
basic = lemmatizer.lemmatize(worst)
print(f"{worst} => {basic}")

adv = lemmatizer.lemmatize(worst, pos="a")
print(f"{worst} => {adv}")

#
# Chunking
#
print("\nChunking\n")

lotr_quote = "It's a dangerous business, Frodo, going out your door."
words_in_lotr_quote = word_tokenize(lotr_quote)
print(words_in_lotr_quote)

print("")
nltk.download("averaged_perceptron_tagger")
lotr_pos_tags = nltk.pos_tag(words_in_lotr_quote)
for one in lotr_pos_tags:
    print(one)

# Aha! RegEx!
grammar = "NP: {<DT>?<JJ>*<NN>}"
chunk_parser = nltk.RegexpParser(grammar)
tree = chunk_parser.parse(lotr_pos_tags)
# Warning: this one requires a graphical desktop
if DRAW_TREES:
    tree.draw()

#
# Chinking
#
print("\nChinking\n")
print(tree)

#
# Using Named Entity Recognition (NER)
#
print("\nUsing Named Entity Recognition (NER)\n")
nltk.download("maxent_ne_chunker")
nltk.download("words")
tree = nltk.ne_chunk(lotr_pos_tags)
if DRAW_TREES:
    tree.draw()

print("Binary")
tree = nltk.ne_chunk(lotr_pos_tags, binary=True)
if DRAW_TREES:
    tree.draw()

quote = """Men like Schiaparelli watched the red planet—it is odd, by-the-bye, that
for countless centuries Mars has been the star of war—but failed to
interpret the fluctuating appearances of the markings they mapped so well.
All that time the Martians must have been getting ready.

During the opposition of 1894 a great light was seen on the illuminated
part of the disk, first at the Lick Observatory, then by Perrotin of Nice,
and then by other observers. English readers heard of it first in the
issue of Nature dated August 2."""

def extract_ne(quote):
     words = word_tokenize(quote)   # , language=language)
     tags = nltk.pos_tag(words)
     tree = nltk.ne_chunk(tags, binary=True)
     return set(
         " ".join(i[0] for i in t)
         for t in tree
         if hasattr(t, "label") and t.label() == "NE"
     )

extracted = extract_ne(quote)
print(f"From this quote:\n---------------------\n{quote}\n---------------------\n\n=> Extracted {extracted}")

#
# Getting text to analyze
#
nltk.download("book")
from nltk.book import *
# text8 comes from the above
text8.concordance("man")
text8.concordance("woman")
#
# Requires graphical desktop
print("\tDisplaying diagram")
text8.dispersion_plot(
    ["woman", "lady", "girl", "gal", "man", "gentleman", "boy", "guy"]
)
print("\tDisplaying diagram")
text2.dispersion_plot(["Allenham", "Whitwell", "Cleveland", "Combe"])

#
# Making a Frequency Distribution
#
print("\nMaking a Frequency Distribution\n")

from nltk import FreqDist
frequency_distribution = FreqDist(text8)
print(frequency_distribution)
twenty_top = frequency_distribution.most_common(20)
for one in twenty_top:
    print(one)

meaningful_words = [
   word for word in text8 if word.casefold() not in stop_words
]
frequency_distribution = FreqDist(meaningful_words)
twenty_top = frequency_distribution.most_common(20)
for one in twenty_top:
    print(one)

print("\tDisplaying diagram")
frequency_distribution.plot(20, cumulative=True)

#
# Finding Collocations
#
print("\nFinding Collocations\n")

print("-- One")
collocations = text8.collocations()

print("\n-- Two")
lemmatized_words = [lemmatizer.lemmatize(word) for word in text8]
new_text = nltk.Text(lemmatized_words)
new_text.collocations()

print("\nDone!")
