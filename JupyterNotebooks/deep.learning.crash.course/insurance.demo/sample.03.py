#
# Insurance Company model training, over-fitting?
# Saves the model at the end
#
import warnings
import pandas as pd
import tensorflow as tf
from tensorflow import keras
# package scikit-learn
from sklearn.model_selection import train_test_split
from tensorflow.keras.layers import Dense, Dropout, BatchNormalization, Activation
import os.path
import subprocess as sp
import sys

sys.path.append('../')
# import tf_utils

warnings.filterwarnings('ignore')

print("Pandas version", pd.__version__)

# tf.logging.set_verbosity(tf.logging.ERROR)
print("TensorFlow version", tf.__version__)

# let's see what compute devices we have available, hopefully a GPU
# sess = tf_utils.get_TF_session()
# devices = sess.list_devices()
devices = tf.config.list_physical_devices()

print("----- D E V I C E S -----")
for d in devices:
    print(d.name)
print("-------------------------")

# a small sanity check, does tf seem to work ok?
hello = tf.constant('Hello TF!')
# print(sess.run(hello))
print(hello)

print("Keras version", keras.__version__)

found_data = False
if os.path.isfile('./insurance-customers-1500.csv'):
    found_data = True

if not found_data:
    print("Data file insurance-customers-1500.csv is not here")
    userInput = input("Do you want to download it now ? Y/n > ")
    if userInput == '' or userInput == 'y' or userInput == 'Y':
        print("Downloading...")
        sp.run(["curl", "-O",
                "https://raw.githubusercontent.com/DJCordhose/deep-learning-crash-course-notebooks/master/data/insurance-customers-1500.csv"])
    else:
        print("Ok, exiting.")
        sys.exit()

df = pd.read_csv('./insurance-customers-1500.csv', sep=';')
y = df['group']  # This will be holding the expected output
df.drop('group', axis='columns', inplace=True)  # Remove it from the input parameters
# X = df.as_matrix()  # Not available anymore in Pandas 1.1.x
X = df.to_numpy()

df.head()

df.describe()

X_train, X_test, y_train, y_test = train_test_split(X, y, test_size=0.2, random_state=42, stratify=y)

print(X_train.shape, y_train.shape, X_test.shape, y_test.shape)

X_train_2_dim = X_train[:, :2]
X_test_2_dim = X_test[:, :2]

num_categories = 3

print("Assembling the network")

dropout = 0.6
model = keras.Sequential()

model.add(Dense(500, name='HiddenLayer1', input_dim=2))
# model.add(BatchNormalization())
model.add(Activation('relu'))
# model.add(Dropout(dropout))

model.add(Dense(500, name='HiddenLayer2'))
# model.add(BatchNormalization())
model.add(Activation('relu'))
# model.add(Dropout(dropout))

model.add(Dense(num_categories, name='SoftmaxLayer', activation='softmax'))

model.compile(loss='sparse_categorical_crossentropy',
              optimizer='adam',
              metrics=['accuracy'])
print("\nModel summary:")
model.summary()

# reducing batch size might increase over-fitting,
# but might be necessary to reduce memory requirements
BATCH_SIZE = 1_000

# reduce this based on what you see in the training history
EPOCHS = 10_000

print("Starting the training...")
# below, set verbose to 0 to zip it up
history = model.fit(X_train_2_dim, y_train, epochs=EPOCHS, batch_size=BATCH_SIZE, validation_split=0.2, verbose=1)
print("Training completed!")

train_loss, train_accuracy = model.evaluate(X_train_2_dim, y_train, batch_size=BATCH_SIZE)
print("Training Accuracy {}%".format(100 * train_accuracy))

test_loss, test_accuracy = model.evaluate(X_test_2_dim, y_test, batch_size=BATCH_SIZE)
print("Testing Accuracy {}%".format(100 * test_accuracy))

print("Saving the model")
model.save('insurance.h5')
print("Done")
