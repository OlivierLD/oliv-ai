# This is the pure Python equivalent of text_classification.ipynb,
# found at https://colab.research.google.com/github/tensorflow/docs/blob/master/site/en/tutorials/keras/text_classification.ipynb#scrollTo=nQauv38Lnok3
# Can be copied to your Google Drive to be modified and messed with.
#
# My copy at https://colab.research.google.com/drive/1ySPklzrWNhK9XNzrrNJ_MCZkNzp0luEW#scrollTo=XBNyWry4rJnb, model will be zipped for download.
# WiP at https://colab.research.google.com/drive/1OHBedJv8aqg1hpeKlf5DBfPuVYGFZinO#scrollTo=-6adt4Rype8Z
#
##### Copyright 2019 The TensorFlow Authors.
"""

# Basic text classification

<table class="tfo-notebook-buttons" align="left">
  <td>
    <a target="_blank" href="https://www.tensorflow.org/tutorials/keras/text_classification"><img src="https://www.tensorflow.org/images/tf_logo_32px.png" />View on TensorFlow.org</a>
  </td>
  <td>
    <a target="_blank" href="https://colab.research.google.com/github/tensorflow/docs/blob/master/site/en/tutorials/keras/text_classification.ipynb"><img src="https://www.tensorflow.org/images/colab_logo_32px.png" />Run in Google Colab</a>
  </td>
  <td>
    <a target="_blank" href="https://github.com/tensorflow/docs/blob/master/site/en/tutorials/keras/text_classification.ipynb"><img src="https://www.tensorflow.org/images/GitHub-Mark-32px.png" />View source on GitHub</a>
  </td>
  <td>
    <a href="https://storage.googleapis.com/tensorflow_docs/docs/site/en/tutorials/keras/text_classification.ipynb"><img src="https://www.tensorflow.org/images/download_logo_32px.png" />Download notebook</a>
  </td>
</table>

This tutorial demonstrates text classification starting from plain text files stored on disk. You'll train a binary classifier to perform sentiment analysis on an IMDB dataset. At the end of the notebook, there is an exercise for you to try, in which you'll train a multiclass classifier to predict the tag for a programming question on Stack Overflow.
"""
print(">> Text Classification, Let's go!")

import matplotlib.pyplot as plt
import sys
import os
from os import path
import re
import shutil
import string
import tensorflow as tf

from tensorflow.keras import layers
from tensorflow.keras import losses
from tensorflow.keras import preprocessing
from tensorflow.keras.layers.experimental.preprocessing import TextVectorization

print(">> Done with imports...")

print("--- Proxies ---")
try:
    print("HTTP_PROXY:  {}".format(os.environ['HTTP_PROXY']))
except KeyError:
    print("HTTP_PROXY:  Not set")
try:
    print("HTTPS_PROXY: {}".format(os.environ['HTTPS_PROXY']))
except KeyError:
    print("HTTPS_PROXY:  Not set")
print("---------------")


print("Python version")
print(sys.version)


def user_input(prompt):
    try:
        value = input(">> {} ".format(prompt))
        return value
    except KeyboardInterrupt as ki:
        print("\nKeyboard Interrupt... Exiting.")
        sys.exit(1)


print("TensorFlow version {}".format(tf.__version__))

"""
## Sentiment analysis

This notebook trains a sentiment analysis model to classify movie reviews as *positive* or *negative*, based on the text of the review. 
This is an example of *binary*—or two-class—classification, an important and widely applicable kind of machine learning problem.

You'll use the [Large Movie Review Dataset](https://ai.stanford.edu/~amaas/data/sentiment/) that contains the text of 50,000 movie reviews 
from the [Internet Movie Database](https://www.imdb.com/). 
These are split into 25,000 reviews for training and 25,000 reviews for testing. 
The training and testing sets are *balanced*, meaning they contain an equal number of positive and negative reviews.

### Download and explore the IMDB dataset

Let's download and extract the dataset, then explore the directory structure.
"""

#
# Set proxy if needed
# export HTTP_PROXY and HTTPS_PROXY
#

content = os.listdir(".")
print("Current folder's content:\n{}".format(content))

DATASET_FOLDER = "./aclImdb"

data_exists = False
if path.exists(DATASET_FOLDER):
    data_exists = True
    response = user_input("Delete existing data ? y|N > ")
    if response.lower() == 'y':
        shutil.rmtree(DATASET_FOLDER)
        data_exists = False

response = "Y"
if data_exists:
    response = user_input("Re-download the dataset ? y|N > ")
else:
    print("Now downloading the dataset")
if response.lower() == 'y':
    url = "https://ai.stanford.edu/~amaas/data/sentiment/aclImdb_v1.tar.gz"
    dataset = tf.keras.utils.get_file("aclImdb_v1.tar.gz", url,
                                        untar=True, cache_dir='.',
                                        cache_subdir='')

    dataset_dir = os.path.join(os.path.dirname(dataset), 'aclImdb')
    dummy = user_input("Download completed in {}, now listing the aclImdb folder, hit [return] ".format(dataset_dir))

    os.listdir(dataset_dir)
else:
    dataset_dir = DATASET_FOLDER

train_dir = os.path.join(dataset_dir, 'train')  # Takes care of the File.separator
os.listdir(train_dir)

"""
The `aclImdb/train/pos` and `aclImdb/train/neg` directories contain many text files, each of which is a single movie review. 
Let's take a look at one of them.
"""

dummy = user_input("Sample data, positive review, 1181_9.txt (hit [return]) :")
sample_file = os.path.join(train_dir, 'pos/1181_9.txt')
with open(sample_file) as f:
    print(f.read())

"""
### Load the dataset

Next, you will load the data off disk and prepare it into a format suitable for training. 
To do so, you will use the helpful [text_dataset_from_directory](https://www.tensorflow.org/api_docs/python/tf/keras/preprocessing/text_dataset_from_directory) utility, 
which expects a directory structure as follows.

```
main_directory/
...class_a/
......a_text_1.txt
......a_text_2.txt
...class_b/
......b_text_1.txt
......b_text_2.txt
```

To prepare a dataset for binary classification, you will need two folders on disk, corresponding to `class_a` and `class_b`. 
These will be the positive and negative movie reviews, which can be found in  `aclImdb/train/pos` and `aclImdb/train/neg`. 
As the IMDB dataset contains additional folders, you will remove them before using this utility.
"""

dummy = user_input("Removing {}/unsup (hit [return]) :".format(train_dir))
remove_dir = os.path.join(train_dir, 'unsup')
try:
    shutil.rmtree(remove_dir)
except FileNotFoundError:
    print("{} not found, moving on.".format(remove_dir))

"""
Next, you will use the `text_dataset_from_directory` utility to create a labeled `tf.data.Dataset`. 
[tf.data](https://www.tensorflow.org/guide/data) is a powerful collection of tools for working with data. 

When running a machine learning experiment, it is a best practice to divide your dataset into three splits: 
[train](https://developers.google.com/machine-learning/glossary#training_set), 
[validation](https://developers.google.com/machine-learning/glossary#validation_set), 
and [test](https://developers.google.com/machine-learning/glossary#test-set). 

The IMDB dataset has already been divided into train and test, but it lacks a validation set. 
Let's create a validation set using an 80:20 split of the training data by using the `validation_split` argument below.
"""

batch_size = 32
seed = 42

dummy = user_input("Setting training dataset, from 'train' directory (hit [return]) :")
raw_train_ds = tf.keras.preprocessing.text_dataset_from_directory(
    'aclImdb/train', 
    batch_size=batch_size, 
    validation_split=0.2,   # 80:20
    subset='training', 
    seed=seed)

"""
As you can see above, there are 25,000 examples in the training folder, of which you will use 80% (or 20,000) for training. 
As you will see in a moment, you can train a model by passing a dataset directly to `model.fit`. 
If you're new to `tf.data`, you can also iterate over the dataset and print out a few examples as follows.
"""

dummy = user_input("Displaying 3 reviews and their rating (aka label), in (0, 1) (hit [return]) :")
for text_batch, label_batch in raw_train_ds.take(1):
  for i in range(3):
    print("Review", text_batch.numpy()[i])
    print("Label", label_batch.numpy()[i])

"""
Notice the reviews contain raw text (with punctuation and occasional HTML tags like `<br/>`). 
You will show how to handle these in the following section. 

The labels are 0 or 1. To see which of these correspond to positive and negative movie reviews, 
you can check the `class_names` property on the dataset.

"""

print("- Label 0 corresponds to {}".format(raw_train_ds.class_names[0]))
print("- Label 1 corresponds to {}".format(raw_train_ds.class_names[1]))

"""
Next, you will create a validation and test dataset. 
You will use the remaining 5,000 reviews from the training set for validation.

Note:  When using the `validation_split` and `subset` arguments, make sure to either specify a random seed, or to pass `shuffle=False`, 
so that the validation and training splits have no overlap.
"""

dummy = user_input("Setting validation dataset, from 'train' directory (hit [return]) :")
raw_val_ds = tf.keras.preprocessing.text_dataset_from_directory(
    'aclImdb/train', 
    batch_size=batch_size, 
    validation_split=0.2, 
    subset='validation', 
    seed=seed)

dummy = user_input("Now preparing the test dataset, from 'test' directory (hit [return]) :")
raw_test_ds = tf.keras.preprocessing.text_dataset_from_directory(
    'aclImdb/test', 
    batch_size=batch_size)

"""
Note: The Preprocessing APIs used in the following section are experimental in TensorFlow 2.3 and subject to change.

### Prepare the dataset for training

Next, you will standardize, tokenize, and vectorize the data using the helpful `preprocessing.TextVectorization` layer. 

Standardization refers to preprocessing the text, typically to remove punctuation or HTML elements to simplify the dataset. 
Tokenization refers to splitting strings into tokens (for example, splitting a sentence into individual words, by splitting on whitespace). 
Vectorization refers to converting tokens into numbers so they can be fed into a neural network. 
All of these tasks can be accomplished with this layer.

As you saw above, the reviews contain various HTML tags like `<br />`. 
These tags will not be removed by the default standardizer in the `TextVectorization` layer (which converts text to lowercase and 
strips punctuation by default, but doesn't strip HTML). You will write a custom standardization function to remove the HTML.

Note: to prevent [train/test skew](https://developers.google.com/machine-learning/guides/rules-of-ml#training-serving_skew) 
(also known as train/serving skew), it is important to preprocess the data identically at train and test time. 
To facilitate this, the `TextVectorization` layer can be included directly inside your model, as shown later in this tutorial.
"""


def custom_standardization(input_data):
    lowercase = tf.strings.lower(input_data)
    stripped_html = tf.strings.regex_replace(lowercase, '<br />', ' ')
    return tf.strings.regex_replace(stripped_html,
                                      '[%s]' % re.escape(string.punctuation),
                                      '')

"""
Next, you will create a `TextVectorization` layer. you will use this layer to standardize, tokenize, and vectorize our data. 
You set the `output_mode` to `int` to create unique integer indices for each token.

Note that you're using the default split function, and the custom standardization function you defined above. 
You'll also define some constants for the model, like an explicit maximum `sequence_length`, which will cause the layer to 
pad or truncate sequences to exactly `sequence_length` values.
"""

max_features = 10000
sequence_length = 250

dummy = user_input("Using a TextVectorization layer (hit [return]) :")
vectorize_layer = TextVectorization(
    standardize=custom_standardization,
    max_tokens=max_features,
    output_mode='int',
    output_sequence_length=sequence_length)

"""
Next, you will call `adapt` to fit the state of the preprocessing layer to the dataset. 
This will cause the model to build an index of strings to integers.

Note: it's important to only use your training data when calling adapt (using the test set would leak information).
"""

# Make a text-only dataset (without labels), then call adapt
train_text = raw_train_ds.map(lambda x, y: x)
vectorize_layer.adapt(train_text)

"""
Let's create a function to see the result of using this layer to preprocess some data.
"""


def vectorize_text(text, label):
    text = tf.expand_dims(text, -1)
    return vectorize_layer(text), label


# retrieve a batch (of 32 reviews and labels) from the dataset
dummy = user_input("Retrieve a batch from dataset, review, label, and vectorized review (hit [return]) :")
text_batch, label_batch = next(iter(raw_train_ds))
first_review, first_label = text_batch[0], label_batch[0]
print("Review", first_review)
print("Label", raw_train_ds.class_names[first_label])
print("Vectorized review", vectorize_text(first_review, first_label))

dummy = user_input("See above, each token replaced with an integer (hit [return]) :")
"""
As you can see above, each token has been replaced by an integer. 
You can lookup the token (string) that each integer corresponds to by calling `.get_vocabulary()` on the layer.
"""

print("1287 ---> ",vectorize_layer.get_vocabulary()[1287])
print(" 313 ---> ",vectorize_layer.get_vocabulary()[313])
print('Vocabulary size: {}'.format(len(vectorize_layer.get_vocabulary())))
dummy = user_input("See above, the integer and its corresponding word (hit [return]) :")

"""
You are nearly ready to train your model. 
As a final preprocessing step, you will apply the TextVectorization layer you 
created earlier to the train, validation, and test dataset.
"""
dummy = user_input("Now applying the TextVectorization to all datasets (hit [return]) :")
train_ds = raw_train_ds.map(vectorize_text)
val_ds = raw_val_ds.map(vectorize_text)
test_ds = raw_test_ds.map(vectorize_text)

"""
### Configure the dataset for performance

These are two important methods you should use when loading data to make sure that I/O does not become blocking.

`.cache()` keeps data in memory after it's loaded off disk. 
This will ensure the dataset does not become a bottleneck while training your model. 
If your dataset is too large to fit into memory, you can also use this method to create a performant on-disk cache, 
which is more efficient to read than many small files.

`.prefetch()` overlaps data preprocessing and model execution while training. 

You can learn more about both methods, as well as how to cache data to disk in 
the [data performance guide](https://www.tensorflow.org/guide/data_performance).
"""

dummy = user_input("Now configuring for performance... (hit [return]) :")
AUTOTUNE = tf.data.experimental.AUTOTUNE

train_ds = train_ds.cache().prefetch(buffer_size=AUTOTUNE)
val_ds = val_ds.cache().prefetch(buffer_size=AUTOTUNE)
test_ds = test_ds.cache().prefetch(buffer_size=AUTOTUNE)

"""
### Create the model

It's time to create our neural network:
"""

dummy = user_input("Now creating the model (Neural Network) (hit [return]) :")
embedding_dim = 16

model = tf.keras.Sequential([
  layers.Embedding(max_features + 1, embedding_dim),
  layers.Dropout(0.2),
  layers.GlobalAveragePooling1D(),
  layers.Dropout(0.2),
  layers.Dense(1)])

model.summary()

"""
The layers are stacked sequentially to build the classifier:

1. The first layer is an `Embedding` layer. This layer takes the integer-encoded reviews and looks up an embedding vector for each word-index. 
   These vectors are learned as the model trains. The vectors add a dimension to the output array. 
   The resulting dimensions are: `(batch, sequence, embedding)`.  
   To learn more about embeddings, see the [word embedding tutorial](../text/word_embeddings.ipynb).
2. Next, a `GlobalAveragePooling1D` layer returns a fixed-length output vector for each example by averaging over the sequence dimension. 
   This allows the model to handle input of variable length, in the simplest way possible.
3. This fixed-length output vector is piped through a fully-connected (`Dense`) layer with 16 hidden units. 
4. The last layer is densely connected with a single output node.

### Loss function and optimizer

A model needs a loss function and an optimizer for training. 
Since this is a binary classification problem and the model outputs a probability (a single-unit layer with a sigmoid activation), 
you'll use `losses.BinaryCrossentropy` loss function.

Now, configure the model to use an optimizer and a loss function:
"""

model.compile(loss=losses.BinaryCrossentropy(from_logits=True),
              optimizer='adam',
              metrics=tf.metrics.BinaryAccuracy(threshold=0.0))

"""
### Train the model

You will train the model by passing the `dataset` object to the fit method.
"""

dummy = user_input("Training the model (fit). (hit [return]) :")
epochs = 10
history = model.fit(
    train_ds,
    validation_data=val_ds,
    epochs=epochs)

"""
### Evaluate the model

Let's see how the model performs. 
Two values will be returned. Loss (a number which represents our error, lower values are better), and accuracy.
"""

dummy = user_input("Model is trained, now evaluating it on test data (hit [return]) :")
loss, accuracy = model.evaluate(test_ds)

print("Loss    : ", loss)
print("Accuracy: ", accuracy)

"""
This fairly naive approach achieves an accuracy of about 86%.

### Create a plot of accuracy and loss over time

`model.fit()` returns a `History` object that contains a dictionary with everything that happened during training:
"""

dummy = user_input("Plotting the accuracy and loss results (hit [return]) :")
history_dict = history.history
history_dict.keys()

"""
There are four entries: one for each monitored metric during training and validation. 
You can use these to plot the training and validation loss for comparison, as well as the training and validation accuracy:
"""

acc = history_dict['binary_accuracy']
val_acc = history_dict['val_binary_accuracy']
loss = history_dict['loss']
val_loss = history_dict['val_loss']

epochs = range(1, len(acc) + 1)

# "bo" is for "blue dot"
plt.plot(epochs, loss, 'bo', label='Training loss')
# b is for "solid blue line"
plt.plot(epochs, val_loss, 'b', label='Validation loss')
plt.title('Training and validation loss')
plt.xlabel('Epochs')
plt.ylabel('Loss')
plt.legend()

plt.show()

plt.plot(epochs, acc, 'bo', label='Training acc')
plt.plot(epochs, val_acc, 'b', label='Validation acc')
plt.title('Training and validation accuracy')
plt.xlabel('Epochs')
plt.ylabel('Accuracy')
plt.legend(loc='lower right')

plt.show()

"""
In this plot, the dots represent the training loss and accuracy, and the solid lines are the validation loss and accuracy.

Notice the training loss *decreases* with each epoch and the training accuracy *increases* with each epoch. 
This is expected when using a gradient descent optimization—it should minimize the desired quantity on every iteration.

This isn't the case for the validation loss and accuracy—they seem to peak before the training accuracy. 
This is an example of overfitting: the model performs better on the training data than it does on data it has never seen before. 
After this point, the model over-optimizes and learns representations *specific* to the training data that do not *generalize* to test data.

For this particular case, you could prevent overfitting by simply stopping the training when the validation accuracy is no longer increasing. 
One way to do so is to use the [EarlyStopping callback](https://www.tensorflow.org/api_docs/python/tf/keras/callbacks/EarlyStopping?version=nightly).

## Export the model

In the code above, you applied the `TextVectorization` layer to the dataset before feeding text to the model. 
If you want to make your model capable of processing raw strings (for example, to simplify deploying it), 
you can include the `TextVectorization` layer inside your model. 
To do so, you can create a new model using the weights you just trained.
"""

dummy = user_input("Saving first model (hit [return]) :")
try:
    model.save("model_01.h5")
except Exception as ex:
    print("Error saving model: {}".format(ex))

print(">> Now exporting the model, including the TextVectorization layer, Sigmoid activation function")
export_model = tf.keras.Sequential([
  vectorize_layer,
  model,
  layers.Activation('sigmoid')
])
# export_model.summary()    # Does not work on this one. Needs to be built or fit first...

export_model.compile(
    loss=losses.BinaryCrossentropy(from_logits=False), optimizer="adam", metrics=['accuracy']
)

print(">> Evaluating exported model")
# Test it with `raw_test_ds`, which yields raw strings
loss, accuracy = export_model.evaluate(raw_test_ds)
print(accuracy)

export_model.build()  # Required for Summary
print("Summary of the exported model")
export_model.summary()

"""
### Inference on new data

To get predictions for new examples, you can simply call `model.predict()`.
"""

dummy = user_input("Putting the model to work (1: Positive, 0: Negative) (hit [return]) :")

examples = [
  "The movie was great!",
  "The movie was okay.",
  "The movie was terrible...",
  "That thing really sucks",
  "I kind of liked it",
  "Never seen a better one",
  "Not really good, not really bad, in my opinion."
]

predictions = export_model.predict(examples)
print("For sentences\n{}\nprediction is \n{}".format(examples, predictions))

print("-- More readable --")
for i in range(len(examples)):
    comment = examples[i]
    score = predictions[i][0]
    review = "So-so"
    if score < 0.4:
        review = "Negative review"
    elif score > 0.6:
        review = "Positive review"
    print("{} => {}".format(comment, review))
print("-------------------")

"""
Including the text preprocessing logic inside your model enables you to export a model for production that simplifies deployment, 
and reduces the potential for [train/test skew](https://developers.google.com/machine-learning/guides/rules-of-ml#training-serving_skew).

There is a performance difference to keep in mind when choosing where to apply your TextVectorization layer. 
Using it outside of your model enables you to do asynchronous CPU processing and buffering of your data when training on GPU. 
So, if you're training your model on the GPU, you probably want to go with this option to get the best 
performance while developing your model, then switch to including the TextVectorization layer inside your model 
when you're ready to prepare for deployment.

Visit this [tutorial](https://www.tensorflow.org/tutorials/keras/save_and_load) to learn more about saving models.

## Exercise: multiclass classification on Stack Overflow questions

This tutorial showed how to train a binary classifier from scratch on the IMDB dataset. 
As an exercise, you can modify this notebook to train a multiclass classifier to predict the tag of a programming question 
on [Stack Overflow](http://stackoverflow.com/).

We have prepared a [dataset](http://storage.googleapis.com/download.tensorflow.org/data/stack_overflow_16k.tar.gz) for you to use 
containing the body of several thousand programming questions (for example, "How can sort a dictionary by value in Python?") posted 
to Stack Overflow. Each of these is labeled with exactly one tag (either Python, CSharp, JavaScript, or Java). 
Your task is to take a question as input, and predict the appropriate tag, in this case, Python. 

The dataset you will work with contains several thousand questions extracted from the much larger public Stack Overflow 
dataset on [BigQuery](https://console.cloud.google.com/marketplace/details/stack-exchange/stack-overflow), 
which contains more than 17 million posts.

After downloading the dataset, you will find it has a similar directory structure to the IMDB dataset you worked with previously:

```
train/
...python/
......0.txt
......1.txt
...javascript/
......0.txt
......1.txt
...csharp/
......0.txt
......1.txt
...java/
......0.txt
......1.txt
```

Note: to increase the difficulty of the classification problem, we have replaced any occurences of the 
      words Python, CSharp, JavaScript, or Java in the programming questions with the word *blank* (as many questions contain the 
      language they're about). 

To complete this exercise, you should modify this notebook to work with the Stack Overflow dataset by making the following modifications:

1. At the top of your notebook, update the code that downloads the IMDB dataset with code to 
   download the [Stack Overflow dataset](http://storage.googleapis.com/download.tensorflow.org/data/stack_overflow_16k.tar.gz) we have 
   preprared. As the Stack Overflow dataset has a similar directory structure, you will not need to make many modifications. 

2. Modify the last layer of your model to read `Dense(4)`, as there are now four output classes.

3. When you compile your model, change the 
   loss to [SparseCategoricalCrossentropy](https://www.tensorflow.org/api_docs/python/tf/keras/losses/SparseCategoricalCrossentropy?version=nightly). 
   This is the correct loss function to use for a multiclass classification problem, when the labels for each class are integers (in our case, they can be 0, *1*, *2*, or *3*).

4. Once these changes are complete, you will be able to train a multiclass classifier. 

If you get stuck, you can find a solution [here](https://github.com/tensorflow/examples/blob/master/community/en/text_classification_solution.ipynb).

## Learning more

This tutorial introduced text classification from scratch. 
To learn more about the text classification workflow in general, we recommend 
reading [this guide](https://developers.google.com/machine-learning/guides/text-classification/) from Google Developers.
"""

print("Saving the model")
# See https://www.tensorflow.org/tutorials/keras/save_and_load
try:
    export_model.save('text_classification_model')   #, save_format='tf')
    print("Model was saved")
except Exception as ex:
    print("Error saving the exported model: {}".format(ex))

print("--- Done! ---")
