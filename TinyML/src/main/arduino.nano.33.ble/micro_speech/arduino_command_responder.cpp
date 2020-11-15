/* Copyright 2019 The TensorFlow Authors. All Rights Reserved.

  Licensed under the Apache License, Version 2.0 (the "License");
  you may not use this file except in compliance with the License.
  You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

  Unless required by applicable law or agreed to in writing, software
  distributed under the License is distributed on an "AS IS" BASIS,
  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
  See the License for the specific language governing permissions and
  limitations under the License.
  ==============================================================================*/

#if defined(ARDUINO) && !defined(ARDUINO_ARDUINO_NANO33BLE)
#define ARDUINO_EXCLUDE_CODE
#endif  // defined(ARDUINO) && !defined(ARDUINO_ARDUINO_NANO33BLE)

#ifndef ARDUINO_EXCLUDE_CODE

#include "command_responder.h"

#include "Arduino.h"

// Toggles the built-in LED every inference, and lights a colored LED depending
// on which word was detected.
void RespondToCommand(tflite::ErrorReporter* error_reporter,
                      int32_t current_time, 
                      const char* found_command,
                      uint8_t score, 
                      bool is_new_command) {
  static bool is_initialized = false;
  if (!is_initialized) { // First time
    pinMode(LED_BUILTIN, OUTPUT);
    // Pins for the built-in RGB LEDs on the Arduino Nano 33 BLE Sense
    pinMode(LEDR, OUTPUT);
    pinMode(LEDG, OUTPUT);
    pinMode(LEDB, OUTPUT);
    // Ensure the LED is off by default.
    // Note: The RGB LEDs on the Arduino Nano 33 BLE
    // Sense are on when the pin is LOW, off when HIGH.
    digitalWrite(LEDR, HIGH);
    digitalWrite(LEDG, HIGH);
    digitalWrite(LEDB, HIGH);
    is_initialized = true;

//    Serial.println("Starting MicroSpeech");
//    Serial.println("--------------------");
}
  static int32_t last_command_time = 0;
  static int count = 0;
  static int certainty = 220;

  if (is_new_command) {

// yes, no, unknown, silence, ..., plus possibly up, down, left, right (<= warning: up and unknown begin with the same 'u'), see in the training model, and in micro_features_micro_model_settings.cpp
    // 3 leds available: R, G, B
    TF_LITE_REPORT_ERROR(error_reporter, ">> Are you talking to me? Heard %s (score %d / %d) @%d ms",
                         found_command, score, certainty, current_time);
    // If we hear a command, light up the appropriate LED
    if (found_command[0] == 'y') { // Yes
      Serial.println("\tYYYYYYES!!");
      last_command_time = current_time;
      digitalWrite(LEDG, LOW);  // Green for yes.
    }

    if (found_command[0] == 'n') { // No
      Serial.println("\tNNNNNNNNO!");
      last_command_time = current_time;
      digitalWrite(LEDR, LOW);  // Red for no.
    }

    if (false && found_command[0] == 's') { // Warning, read the line <=
      Serial.println("\t ...Silence");
      last_command_time = current_time;
      digitalWrite(LEDR, LOW);  // Red AND Green for silence
      digitalWrite(LEDG, LOW); 
    }

    if (found_command[0] == 'u' && found_command[1] == 'n') { // Unknown
      last_command_time = current_time;
      digitalWrite(LEDB, LOW);  // Blue for unknown
    }

//    if (found_command[0] == 'u' && found_command[1] == 'p') { // Up
//      Serial.println("\tUP!");
//      last_command_time = current_time;
//    }
//
//    if (found_command[0] == 'd') { // Down
//      Serial.println("\tDOWN!");
//      last_command_time = current_time;
//    }
//
//    if (found_command[0] == 'l') { // Left
//      Serial.println("\tLEFT!");
//      last_command_time = current_time;
//    }
//
//    if (found_command[0] == 'r') { // Right
//      Serial.println("\tRIGHT!");
//      last_command_time = current_time;
//    }
  }

  // If last_command_time is non-zero but was >3 seconds ago, zero it
  // and switch off the LED.
  if (last_command_time != 0) {
    if (last_command_time < (current_time - 3000)) {
      last_command_time = 0;
      digitalWrite(LED_BUILTIN, LOW);
      digitalWrite(LEDR, HIGH);
      digitalWrite(LEDG, HIGH);
      digitalWrite(LEDB, HIGH);
    }
    // If it is non-zero but <3 seconds ago, do nothing.
    return;
  }

  // Otherwise, toggle the LED every time an inference is performed.
  ++count;
  if (count & 1) {
    digitalWrite(LED_BUILTIN, HIGH);
  } else {
    digitalWrite(LED_BUILTIN, LOW);
  }
}

#endif  // ARDUINO_EXCLUDE_CODE
