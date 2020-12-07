#
# Video at https://www.youtube.com/watch?v=u2TjZzNuly8
# Notebook at https://colab.research.google.com/github/lmoroney/dlaicourse/blob/master/Course%202%20-%20Part%208%20-%20Lesson%202%20-%20Notebook%20(RockPaperScissors).ipynb
# Dataset at https://www.tensorflow.org/datasets/catalog/rock_paper_scissors
#

# 1 - Preamble - Get the dataset
# ------------------------------
# wget --no-check-certificate \
#     https://storage.googleapis.com/laurencemoroney-blog.appspot.com/rps.zip \
#     -O ./rps.zip
#
# wget --no-check-certificate \
#     https://storage.googleapis.com/laurencemoroney-blog.appspot.com/rps-test-set.zip \
#     -O ./rps-test-set.zip

# Extract data
import os
import sys
from os import path
import zipfile
import matplotlib.pyplot as plt
import matplotlib.image as mpimg
import numpy as np
import tensorflow as tf
# import keras_preprocessing
from keras_preprocessing import image
from keras_preprocessing.image import ImageDataGenerator

data_dir_name = "rps"
archive_name = "rps.zip"
if not path.exists(data_dir_name):
    # Unzip the archive
    print("Extracting data set")
    zip_ref = zipfile.ZipFile(archive_name, 'r')
    zip_ref.extractall('./')
    zip_ref.close()
else:
    print("DataSet was there already")

data_dir_name = "rps-test-set"
archive_name = "rps-test-set.zip"
if not path.exists(data_dir_name):
    # Unzip the archive
    print("Extracting test data set")
    zip_ref = zipfile.ZipFile(archive_name, 'r')
    zip_ref.extractall('./')
    zip_ref.close()
else:
    print("Test DataSet was there already")

rock_dir = os.path.join('./rps/rock')
paper_dir = os.path.join('./rps/paper')
scissors_dir = os.path.join('./rps/scissors')

print('total training rock images:', len(os.listdir(rock_dir)))
print('total training paper images:', len(os.listdir(paper_dir)))
print('total training scissors images:', len(os.listdir(scissors_dir)))

rock_files = os.listdir(rock_dir)
print(rock_files[:10])

paper_files = os.listdir(paper_dir)
print(paper_files[:10])

scissors_files = os.listdir(scissors_dir)
print(scissors_files[:10])

pic_index = 2

next_rock = [os.path.join(rock_dir, fname)
             for fname in rock_files[pic_index - 2:pic_index]]
next_paper = [os.path.join(paper_dir, fname)
              for fname in paper_files[pic_index - 2:pic_index]]
next_scissors = [os.path.join(scissors_dir, fname)
                 for fname in scissors_files[pic_index - 2:pic_index]]

if False:
    print("Sample images...")
    for i, img_path in enumerate(next_rock + next_paper + next_scissors):
        # print(img_path)
        img = mpimg.imread(img_path)
        plt.imshow(img)
        plt.axis('Off')
        plt.show()

TRAINING_DIR = "./rps/"
training_datagen = ImageDataGenerator(
    rescale=1. / 255,
    rotation_range=40,
    width_shift_range=0.2,
    height_shift_range=0.2,
    shear_range=0.2,
    zoom_range=0.2,
    horizontal_flip=True,
    fill_mode='nearest')

VALIDATION_DIR = "./rps-test-set/"
validation_datagen = ImageDataGenerator(rescale=1. / 255)

train_generator = training_datagen.flow_from_directory(
    TRAINING_DIR,
    target_size=(150, 150),
    class_mode='categorical',
    batch_size=126
)

validation_generator = validation_datagen.flow_from_directory(
    VALIDATION_DIR,
    target_size=(150, 150),
    class_mode='categorical',
    batch_size=126
)

model = tf.keras.models.Sequential([
    # Note the input shape is the desired size of the image 150x150 with 3 bytes color
    # This is the first convolution
    tf.keras.layers.Conv2D(64, (3, 3), activation=tf.nn.relu, input_shape=(150, 150, 3)),   # 3 in input_shape: 3 output classes
    tf.keras.layers.MaxPooling2D(2, 2),
    # The second convolution
    tf.keras.layers.Conv2D(64, (3, 3), activation=tf.nn.relu),
    tf.keras.layers.MaxPooling2D(2, 2),
    # The third convolution
    tf.keras.layers.Conv2D(128, (3, 3), activation=tf.nn.relu),
    tf.keras.layers.MaxPooling2D(2, 2),
    # The fourth convolution
    tf.keras.layers.Conv2D(128, (3, 3), activation=tf.nn.relu),
    tf.keras.layers.MaxPooling2D(2, 2),
    # Flatten the results to feed into a DNN
    tf.keras.layers.Flatten(),
    tf.keras.layers.Dropout(0.5),
    # 512 neuron hidden layer
    tf.keras.layers.Dense(512, activation=tf.nn.relu),
    tf.keras.layers.Dense(3, activation=tf.nn.softmax)
])

model.summary()

model.compile(loss='categorical_crossentropy',
              optimizer='rmsprop',
              metrics=['accuracy'])

model_name = "rps.h5"
if not path.exists(model_name):
    print("Now training... Go get a coffee!")
    history = model.fit(train_generator,
                        epochs=25,
                        steps_per_epoch=20,
                        validation_data=validation_generator,
                        verbose=1,
                        validation_steps=3)

    model.save(model_name)

    acc = history.history['accuracy']
    val_acc = history.history['val_accuracy']
    loss = history.history['loss']
    val_loss = history.history['val_loss']

    epochs = range(len(acc))

    plt.plot(epochs, acc, 'r', label='Training accuracy')
    plt.plot(epochs, val_acc, 'b', label='Validation accuracy')
    plt.title('Training and validation accuracy')
    plt.legend(loc=0)
    plt.figure()

    plt.show()
else:
    try:
        model = tf.keras.models.load_model(model_name)
        print(">> Model is now loaded")
    except OSError as ose:
        print('Model not found?')
        print(ose)
        sys.exit(1)  # Bam!

# On real data, uploaded, or read from the dataset
rock_files = os.listdir(rock_dir)
paper_files = os.listdir(paper_dir)
scissors_files = os.listdir(scissors_dir)

# print('total training rock images:', len(rock_files))
# print('total training paper images:', len(paper_files))
# print('total training scissors images:', len(scissors_files))

import random

labels = [ "Paper", "Rock", "Scissors" ]

print("Trying 10 predictions...")
for dummy in range(10):
    rock_idx = int(random.random() * len(rock_files))
    paper_idx = int(random.random() * len(paper_files))
    scissors_idx = int(random.random() * len(scissors_files))

    rock_file = rock_files[rock_idx]
    paper_file = paper_files[paper_idx]
    scissors_file = scissors_files[scissors_idx]

    rock_path = os.path.join(rock_dir, rock_file)
    paper_path = os.path.join(paper_dir, paper_file)
    scissors_path = os.path.join(scissors_dir, scissors_file)

    files_to_submit = [
        rock_path,
        paper_path,
        scissors_path
    ]

    random_class = int(random.random() * len(labels))
    path = files_to_submit[random_class]

    img = image.load_img(path, target_size=(150, 150))
    x = image.img_to_array(img)    # TODO What is that?
    x = np.expand_dims(x, axis=0)

    images = np.vstack([x])
    classes = model.predict(images, batch_size=10)
    # print("File {} => {}".format(path, classes))
    result = -1
    for i in range(len(classes[0])):  # Look for the 1.
        if classes[0][i] == 1:
            result = i

    print("{} {}, found {} => {}".format(path, classes, result, labels[result]))
    display_img = mpimg.imread(path)
    plt.imshow(display_img)
    plt.axis('Off')
    plt.title(labels[result])
    plt.show()

print("Done!")

# TODO The same thing, with a webcam and OpenCV
