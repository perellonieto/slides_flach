## Latent variable models

- Psychologists have long understood that people's abilities (and the difficulty of a task) are not directly observable and need to be estimated. 
  - Item-response theory, factor analysis
- We can adapt those models to machine learning, to estimate ability of classifiers as well as difficulty of instances and datasets. 


### Item-Response Theory

![IRT](img/IRT.png)  <!-- .element height="40%" width="40%" -->

$E[x_{ij}|\delta_j,a_j] = \frac{1}{1+\exp(-a_j(\theta_i-\delta_j))}$


### Beta-IRT

![Beta-IRT](img/BIRT.png)  <!-- .element height="40%" width="40%" -->

$E[p_{ij}|\delta_j,a_j] = \frac{1}{1+\left(\frac{\delta_i}{\theta_j}\cdot\frac{1-\theta_j}{1-\delta_i} \right)^{a_j}}$


### Reference

- [Chen, Y., Prudencio, R.B., Diethe, T. and Flach, P., 2019. $\beta^3$-IRT: A New Item Response Model and its Applications. AISTATS 2019.](http://proceedings.mlr.press/v89/chen19b.html)
