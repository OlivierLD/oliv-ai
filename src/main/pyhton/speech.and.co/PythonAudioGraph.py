#
# From https://medium.com/quick-code/graphing-real-time-audio-with-python-213be536b094
# See https://matplotlib.org/3.1.1/gallery/subplots_axes_and_figures/figure_title.html
# See https://numpy.org/doc/stable/reference/generated/numpy.amin.html
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
# I had to look for a good value for CHUNK, to avoid messages like "[Errno -9981] Input overflowed" ...
CHUNK = 750  # 500  # int(RATE/20)
stream = mic.open(format=FORMAT, channels=CHANNELS, rate=RATE, input=True, output=True, frames_per_buffer=CHUNK)

fig, ax = plt.subplots(figsize=(14,6))
fig.canvas.manager.set_window_title("Graphed Sound!")  # Window title
fig.suptitle('Sound as Graph', fontsize=12)   # Figure title
x = np.arange(0, 2 * CHUNK, 2)
ax.set_ylim(-2000, 2000)  # Was 200, 200, too narrow
ax.set_xlim(0, CHUNK) # make sure our x axis matched our chunk size
line, = ax.plot(x, np.random.rand(CHUNK))
how_many_loops: int = 0

display_data:bool = False
keep_looping:bool = True
plot_min_max:bool = False

while keep_looping:
    how_many_loops += 1
    try:
        #  fig.clf()
        data = stream.read(CHUNK)
        data = np.frombuffer(data, np.int16)
        if display_data:
            print(data)
        min_data:np.int16 = np.amin(data)
        max_data:np.int16 = np.amax(data)
        print(f"Min:{min_data}, Max:{max_data}, Amplitude: {max_data - min_data}")
        line.set_ydata(data)

        if plot_min_max:
            plt.clf()  # Clear
            plt.axhline(y=min_data, color='r', linestyle='-')   # Plot min
            plt.axhline(y=max_data, color='r', linestyle='-')   # Plot max
            # plt.show()

        fig.canvas.draw()
        fig.canvas.flush_events()
        plt.pause(0.01)  # in seconds
    except KeyboardInterrupt:
        print("\nOops! Exiting.")
        keep_looping = False
    except OSError as ose:
        print(f"At loop #{how_many_loops}: {ose}")
        input("Press Enter to continue...")
        break

print("Done. Bye.")
