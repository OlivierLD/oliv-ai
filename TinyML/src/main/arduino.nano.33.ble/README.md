# MicroSpeech
> _Note_: Had problems (Serial port reset during sketch upload) with the `precompiled` Arduino_TensorFlowLite libraries. 
> Prefer the **Non** Precompiled ones.


Main is `main_speech.ino`.

- See output command in `arduino_command_responder.cpp`.
- See in there how to do something smart, how to respond to the `WANTED_WORDS`...
- See `micro_features_micro_model_settings.cpp`
- Tensorflow Model is in `micro_features_model.cpp`

Look for `WANTED_WORDS` in the Jupyter notebooks `train_micro_speech_model` (training model), or
on-line at <https://colab.research.google.com/github/tensorflow/tensorflow/blob/master/tensorflow/lite/micro/examples/micro_speech/train/train_micro_speech_model.ipynb>.
> _Note_: The on-line version can use a GPU...

`WANTED_WORDS` can be `yes`, `no`, `up`, `down`, `left`, `right`, `on`, `off`, `stop`, `go`.

> Note: If the Arduino Nano 33 BLE is stuck in upload mode, double-click on the `reset` button.
