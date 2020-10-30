# import sys

f = open('reviews.txt')
raw_reviews = f.readlines()
f.close()

f = open('labels.txt')
raw_labels = f.readlines()
f.close()

tokens = list(map(lambda x: set(x.split(" ")), raw_reviews))

vocab = set()
for sent in tokens:
    for word in sent:
        if len(word) > 0:
            vocab.add(word)
vocab = list(vocab)

word2index = {}
for i, word in enumerate(vocab):
    word2index[word] = i

input_dataset = list()
for sent in tokens:
    sent_indices = list()
    for word in sent:
        try:
            sent_indices.append(word2index[word])
        except:
            ""  # Absorb
    input_dataset.append(list(set(sent_indices)))

target_dataset = list()
for label in raw_labels:
    if label == 'positive\n':
        target_dataset.append(1)
    else:
        target_dataset.append(0)

# Added... Check validity.
print("Target DataSet: {}", format(target_dataset))
ok = 0
ko = 0
for review in target_dataset:
    if review == 0:
        ko += 1
    else:
        ok += 1
print("{} positive, {} negative".format(ok, ko))
print("Conclusion {}".format("Positive" if ok >= ko else "Negative"))
print("Done")
