# [Jupyter Notebooks](https://jupyter.org/)
Emergence of AI, Machine Learning, and Deep Learning contributed to the popularity of the Jupyter Notebooks.

Notebooks contain **_executable_** code (<u>yes</u>, you can execute the code of a Notebook in real time), possibly (extensively) commented and illustrated.
They can be re-played or just read or seen as they were after their last execution.

As `markdown` language is supported, they can contain whatever `md` syntax supports, images, url, graphics, tables, etc.
As such, graphical data representation can be used. And in the Deep Learning space, they are, indeed.

Notebooks are ideal for tutorials, hence (a part of) their success.

Notebooks are not only for Python (as they were at the very beginning), they also supports _**many**_ other languages!
The main requirement being to have a `REPL` (**R**ead **E**valuate **P**rint **L**oop).
> Note: As such, all languages providing a REPL can potentially be supported by
> Jupyter Notebooks. Among them Python, Java (9+), Scala, NodeJS, Groovy... an more. 

Install Jupyter on the Raspberry Pi is easy:
```
 $ sudo pip3 install jupyter
```
or
```
sudo su -
apt-get update
apt-get install python3-matplotlib
apt-get install python3-scipy
pip3 install --upgrade pip
reboot
sudo pip3 install jupyter
sudo apt-get clean
```
> See also the [Jupyter Installation](https://jupyter.org/install) guide.

The default language for Jupyter is Python. To have more languages available, you need to install what's called `kernels`.
Java kernel, Scala kernel, etc.

## For Java
Java 9 comes with a `REPL` (called `JShell`).

To install Java 9 on the Raspberry Pi, see [here](https://www.raspberrypi.org/forums/viewtopic.php?t=200232). 
> Note: Some restrictions may apply, the Raspberry Pi Zero might not like it.

<!-- sudo apt-get remove ca-certificates-java -->
> April 2019: Still having problems to install JDK 9 on a Raspberry Pi B3+ ... Certificate stuff.
> But all the features described here can be run on a system where Java 9 is happy.

> Aug 2019: The last Raspbian version (Buster) comes with Java 11. All is fixed.

To add the required Java features, see the [SpencerPark](https://github.com/SpencerPark/IJava) git repo:
- <https://blog.frankel.ch/teaching-java-jupyter-notebooks/>
- <https://github.com/SpencerPark/IJava>
- <https://hub.mybinder.org/user/spencerpark-ijava-binder-ey9zwplq/notebooks/3rdPartyDependency.ipynb>

> I installed it from the source (the its `git` repo), see [this](https://github.com/SpencerPark/IJava#install-from-source), it is easy.
>
> _Note_: To install the Java kernel, make sure `jupyter` and related commands are in the `$PATH` of your session.

### Raspberry-Coffee Notebooks

Will provide examples as notebooks, for the features presented in this project.

From this directory (_here_, right where this file you're reading is), just run
```
 $ jupyter notebook
```
or more recently
```
 $ jupyter-notebook
```
And from a browser anywhere on the network of the Raspberry Pi, `raspberry-pi` being the name or address of the Raspberry Pi where the notebook server is running, reach `http://raspberry-pi:8888/tree` to start playing!
 
> Note: You can run the above wherever you have installed `jupyter`, on a Raspberry PI, on a Linux laptop, on a Windows box, etc.
> If you are in a graphical environment, `Jupyter` might even be smart enough to display its home page in your default browser.
>
> You can also run Jupyter in Docker, and access it from outside the docker image, as long as the right HTTP port is exposed.  
 
## For Scala
- For Scala, see [this](https://index.scala-lang.org/jupyter-scala/jupyter-scala/spark-stubs-2/0.4.2?target=_2.11), [this](https://index.scala-lang.org/jupyter-scala/jupyter-scala/protocol/0.1.8?target=_2.12), and [this](https://almond.sh/).
    - The ones above mention `coursier`. Go ahead, it will not leave anything on your system after you're done.
- [This](https://medium.com/@bogdan.cojocar/how-to-run-scala-and-spark-in-the-jupyter-notebook-328a80090b3b) too (for Spark).

Once the Scala Kernel is installed as explained above, just start your `jupyter notebook`
as usual, and you will have the possibility to create Scala Notebooks.

- Graphics in a Scala Notebook, try this: <https://medium.com/swlh/plotting-in-jupyter-notebooks-with-scala-and-evilplot-aacab63a896>
    - Install `Ivy`
    - Add on top of your Notebook:
    ```
    import $ivy.`com.cibo::evilplot-repl:0.7.0`
    ``` 

---
