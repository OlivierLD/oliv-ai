## OpenCV Java
Install Instruction at <https://opencv-java-tutorials.readthedocs.io/en/latest/01-installing-opencv-for-java.html#install-opencv-3-x-under-macos> 

On Mac OS, do make sure you have
```buildoutcfg
xcode-select --install
```
You will use `brew`, available at <http://brew.sh>.

brew behind a firewall:
```buildoutcfg
all_proxy=http://www-proxy-hqdc.us.oracle.com:80 brew install --build-from-source opencv
```

### Camera access
On Mac, if you see a message like this:
```
OpenCV: not authorized to capture video (status 0), requesting...
OpenCV: can not spin main run loop from other thread, set OPENCV_AVFOUNDATION_SKIP_AUTH=1 to disable authorization request and perform it in your application.
OpenCV: camera failed to properly initialize!
```
Then you need to add those keys in `/Library/Java/JavaVirtualMachines/jdk-[Your-JDK].jdk/Contents/Info.plist`: 
```xml
         <!-- Added for OpenCV -->
         <key>NSCameraUsageDescription</key>
         <string>OpenCV</string>
         <key>NSMicrophoneUsageDescription</key>
         <string>OpenCV</string>
         <!---------------------->
```


### JavaFX, Swing, etc
JavaFX was removed from Java 11.
- See how to fix that [here](https://www.youtube.com/watch?time_continue=157&v=WtOgoomDewo&feature=emb_logo),
- and [here](https://openjfx.io/openjfx-docs/).
- See [here](https://www.infoworld.com/article/3305073/removed-from-jdk-11-javafx-11-arrives-as-a-standalone-module.html) how to get it.
- Also <https://dzone.com/articles/javafx-on-jdk-11>

---

- Get the binaries from <https://gluonhq.com/products/javafx/>
- Unzip in some place you like
---

## Papers, other docs
- <https://www.tutorialspoint.com/java_dip/create_zooming_effect.htm>
