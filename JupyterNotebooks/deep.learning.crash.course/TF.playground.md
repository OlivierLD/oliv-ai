### How to understand TF Playground output

Let's say you've stopped the training at that point, and you want to see the parameters of your network:
![Example](./img/TF.playground.example.01.png)

To see the **Bias** of a neuron, hover the mouse over the bottom left small square of each neuron:
![Example](./img/TF.playground.example.02.png)

To see the **Weight**, hover the mouse over the incoming connector:
![Example](./img/TF.playground.example.03.png)

This way, you can gather **all** the parameters of your neural network.

This can be captured in a spreadsheet, like that:
![Spreadsheet](./img/spreadsheet.png)

- All the weights and Bias for each neuron are represented in the spreadsheet
- Features (on the left) are the input values
- Result (on the right) is the calculated result.

> The training consist in trying _all_ possible values for _all the weights_ and _all the bias_, to find the expected result.
> > This is Supervised Learning, we know what value we are expecting for each data ([x, y] => color).  
