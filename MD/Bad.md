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
- *Mean Absolute Error* gives expected loss if class distribution is **wrongly estimated** (or classifier uses predicted probabilities to make **stochastic** predictions).
