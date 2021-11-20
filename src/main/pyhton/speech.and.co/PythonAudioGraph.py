#
# pip3 install pyaudio
#   On mac, requires a brew install portaudio
#        On Mac, if fails, try: pip install --global-option='build_ext' --global-option='-I/usr/local/include' --global-option='-L/usr/local/lib' pyaudio
#   On Ubuntu/Debian requires a sudo apt-get install portaudio19-dev python-pyaudio
# pip3 install matplotlib
#
import pyaudio
import struct
import matplotlib.pyplot as plt
import numpy as np

mic = pyaudio.PyAudio()
FORMAT = pyaudio.paInt16
CHANNELS = 1
RATE = 5000
CHUNK = int(RATE/20)
stream = mic.open(format=FORMAT, channels=CHANNELS, rate=RATE, input=True, output=True, frames_per_buffer=CHUNK)

fig, ax = plt.subplots(figsize=(14,6))
x = np.arange(0, 2 * CHUNK, 2)
ax.set_ylim(-200, 200)
ax.set_xlim(0, CHUNK) # make sure our x axis matched our chunk size
line, = ax.plot(x, np.random.rand(CHUNK))

while True:
    try:
        data = stream.read(CHUNK)
        data = np.frombuffer(data, np.int16)
        line.set_ydata(data)
        fig.canvas.draw()
        fig.canvas.flush_events()
        plt.pause(0.01)
    except OSError as ose:
            # keep going
            print(ose)

print("Done")
