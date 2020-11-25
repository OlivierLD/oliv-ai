# Micronaut
Implement a TensorFlow Prediction Process as a serverless micro service.

- Use [`SDKMAN`](https://sdkman.io/) to install Micronaut if not there yet
as described [here](https://micronaut-projects.github.io/micronaut-starter/latest/guide/#installation).
    - To start `SdkMan`: `$ source ~/.sdkman/bin/sdkman-init.sh`
    - Then `sdk version`

- See if `micromaut` is available:
    - `$ mn -V`

- Create a new Micronaut application
```
$ mn create-app digit.prediction.mn
```

We want to implement a `POST` endpoint, receiving an image, and returning what digit it represents, after recognizing it with
a previously trained model.

> This will invoke a Python script to do so.

 In the package `digit.prediction`, add a controller, `PredictionController`:
```java
package digit.prediction;

import io.micronaut.http.MediaType;
import io.micronaut.http.annotation.Consumes;
import io.micronaut.http.annotation.Controller;
import io.micronaut.http.annotation.Post;
import io.micronaut.http.annotation.Produces;

@Controller("/predict")
public class PredictionController {
    @Post("/digit")
    @Consumes(MediaType.APPLICATION_OCTET_STREAM)
    @Produces(MediaType.APPLICATION_JSON)
    public String applyModel() {
        return "{ \"score\": 98.45, \"prediction\": 8 }";
    }
}
```
- The service (dummy for now) is ready to run, from the `mn` directory:
```
$ ./gradlew run
```
Then from another terminal:
```
$ curl -X POST http://localhost:8080/predict/digit | jq
    % Total    % Received % Xferd  Average Speed   Time    Time     Time  Current
                                   Dload  Upload   Total   Spent    Left  Speed
  100    35  100    35    0     0   2692      0 --:--:-- --:--:-- --:--:--  2692
  {
    "score": 98.45,
    "prediction": 8
  }
```

We might want to add an endpoint to get the versions of the different components.
