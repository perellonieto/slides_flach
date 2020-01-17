## Transparency

Transparent machine learning requires knowledge of
- how a model was built;
- how a model makes decisions;
- how well it can be expected to *perform*; 
- what its operating assumptions and limitations are. 


### ML evaluation: some things we have learned

- Need to consider *multiple* measures. 
  - e.g. true & false positive rate, precision & recall
- Operating points & contexts can *change*. 

![ROC curve](img/CC1.png) <!-- .element height="30%" width="30%" -->
![Cost curve](img/CC2.png) <!-- .element height="30%" width="30%" -->


### **Use case** determines *performance measure*

- *Accuracy* assumes **equal misclassification costs**; 
- *F-score* additionally assumes that **true negatives don't add value**; 
- *both* assume a **fixed** operating point and class distribution; 
- *AUC* **aggregates** over operating points and class distributions in a specific way.


#### More here

- [Hernandez-Orallo, J., Flach, P. and Ferri, C., 2012. A unified view of performance metrics: translating threshold choice into expected classification loss. Journal of Machine Learning Research 13(Oct), pp.2813-2869.](http://www.jmlr.org/papers/v13/hernandez-orallo12a.html)
- [Ferri, C., Hernandez-Orallo, J. and Flach, P., 2019. Setting decision thresholds when operating conditions are uncertain. Data Mining and Knowledge Discovery 33, pp.805-847.](https://link.springer.com/article/10.1007/s10618-019-00613-7)


### Many open questions in ML evaluation

- Quantifying performance requires careful consideration of **measurement scales**. Are there ML equivalents of physical units? 
- What we can observe is rarely of direct interest. The most important performance indicators are **latent**! 
- Ultimately empirical ML needs to make **causal** (or counterfactual) statements:

> Algorithm A outperformed algorithm B **because** the classes were highly imbalanced.
