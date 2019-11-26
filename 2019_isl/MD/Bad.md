## So more is better??

We now see *chronic over-reporting* of performance measures without justification: 
- e.g. accuracy/error rate **and** F-score **and** AUC
- e.g. MSE **and** MAE


### Each *measure* assumes a specific **use case**
- *Accuracy* assumes **equal misclassification costs**; 
- *F-score* additionally assumes that **true negatives don't add value**; 
- *both* assume a **fixed** operating point and class distribution; 
- *AUC* **aggregates** over operating points and class distributions in a specific way.

**Use case** determines *performance measure*. 


### MSE vs MAE
Both can be used to evaluate predictive performance, but
- *Mean Squared Error* gives expected misclassification loss if predicted probabilities are thresholded given **known** deployment class distribution; 
- *Mean Absolute Error* gives expected loss if class distribution is **guessed wrongly** (or classifier uses predicted probabilities to make **stochastic** predictions).


### Reference

- [Ferri, C., Hernandez-Orallo, J. and Flach, P., 2019. Setting decision thresholds when operating conditions are uncertain. Data Mining and Knowledge Discovery, pp.1-43.](https://link.springer.com/article/10.1007/s10618-019-00613-7)
