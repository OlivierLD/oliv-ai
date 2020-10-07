# Tribuo, ML in Java
- Available at <https://tribuo.org/>
- Tutorials at <https://tribuo.org/learn/4.0/tutorials/>

- Get the Classification training data:
  ```
  $ wget https://archive.ics.uci.edu/ml/machine-learning-databases/iris/bezdekIris.data
  ```
  or
  ```
  $ wget -e use_proxy=yes \
         -e http_proxy=http://www-proxy.us.oracle.com:80 \
         -e https_proxy=http://www-proxy.us.oracle.com:80 \
         https://archive.ics.uci.edu/ml/machine-learning-databases/iris/bezdekIris.data
  ```
- Run Classification sample:
  ```
  $ ../gradlew runClassification --console plain --no-daemon
  ``` 
  
### Consuming other models?
Seems to be a work in progress. See the [Tribuo Roadmap](https://github.com/oracle/tribuo/blob/main/docs/Roadmap.md).

- <https://tribuo.org/learn/4.0/docs/features.html#general-predictors>
  