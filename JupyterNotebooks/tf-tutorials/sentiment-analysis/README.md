# Define, Train, Serve
### The full process
Based on the [TensorFlow text_classification sample](https://colab.research.google.com/github/tensorflow/docs/blob/master/site/en/tutorials/keras/text_classification.ipynb#scrollTo=GH4_2ZGJsa_X).

#### Define and Train
The notebook `Oliv's_copy_of_text_classification.ipynb` is to be uploaded 
on [ColabNet](https://colab.research.google.com/) (in _your_ drive), where you will have all the required components already installed in
their right versions, along with powerful machines and processors. 

At the end of the notebook, after being defined, trained, and tested, the model is archived into a zip named
`model.zip`, which you can then download.

#### Reuse the model, Serve
Upload the Notebook `LoadingModel.ipynb` as you did before for the other Notebook.

Then, upload the `model.zip` that was previously downloaded.
> _Note:_ you could also save that archive on somewhere on the web, and download it from its URL, as did for the 
> datasets used in the previous Notebook.

See in the code the way we need to re-define the `custom_standardization`, and use it during the `load_model`:
```python
import re
import strings

@tf.keras.utils.register_keras_serializable(
    package='Custom', name=None
)
def custom_standardization(input_data):
  lowercase = tf.strings.lower(input_data)
  stripped_html = tf.strings.regex_replace(lowercase, '<br />', ' ')
  return tf.strings.regex_replace(stripped_html,
                                  '[%s]' % re.escape(string.punctuation),
                                  '')

model = None
with tf.keras.utils.custom_object_scope({'custom_standardization': custom_standardization}):
  model = tf.keras.models.load_model('text_classification_model')  # Folder
```

The archived model will be un-zipped in the code, by the Notebook itself.

Model will then be reloaded from its un archived directory, and predictions will be sent to it.

## Resources
- [Define, Train, Export the model](https://colab.research.google.com/drive/1ySPklzrWNhK9XNzrrNJ_MCZkNzp0luEW?usp=sharing)
- [LoadingModel.ipynb](https://colab.research.google.com/drive/1OHBedJv8aqg1hpeKlf5DBfPuVYGFZinO?usp=sharing)

---
