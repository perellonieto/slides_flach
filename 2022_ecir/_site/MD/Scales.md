## Change of scale examples in ML

Linear interpolation: is it justified? 

Arithmetic averaging: is it justified? 

This is where *scale* really matters. 


### $F_{\beta}$-score

Aka accuracy over a *modified* confusion matrix: 

$$
\begin{array}{lccc}
\hline
           & \text{Pred}\ + & \text{Pred}\ - &     \\\\ \hline
\text{Actual}\ + & {\color{red}{\beta^2}} TP            & {\color{red}{\beta^2}} FN            & {\color{red}{\beta^2}} Pos \\\\
\text{Actual}\ - & FP            & {\color{red}{TP}}            & Neg{\color{red}{-TN+TP}} \\\\
           & \ldots          & \ldots          & \ldots  \\\\ \hline
\end{array}
$$

$$F_{\beta} = \frac{(\beta^2+1) TP}{(\beta^2+1) TP + \beta^2 FN + FP}$$

$$1/F_{\beta} = \frac{\beta^2}{\beta^2+1} 1/rec + \frac{1}{\beta^2+1} 1/prec$$   <!-- .element: class="fragment" -->


### Scale transformations

1. Linearise: e.g., $$prec=TP/(TP+FP) \rightarrow 1/prec = 1+FP/TP$$

2. Map $[1,1/\pi]$ back to $[0,1]$: e.g., $$precG = \frac{prec-\pi}{(1-\pi)prec} = 1 - \frac{\pi}{1-\pi} FP/TP$$  <!-- .element: class="fragment" -->


### Et voila!

![PR curve](img/fig2-left.png) <!-- .element height="40%" width="40%" -->
![PRG curve](img/fig2-right.png) <!-- .element height="40%" width="40%" -->


### The complete picture

![from ROC via PR to PRG](img/PRG.png)


### Reference

- [Flach, P. and Kull, M., 2015. Precision-recall-gain curves: PR analysis done right. In Advances in neural information processing systems (pp. 838-846).](http://people.cs.bris.ac.uk/~flach/PRGcurves)


## Squared loss and Log-loss

- These are most commonly used to evaluate *probability estimates* against 'ideal' probabilities 0 and 1. 
- Alternatively, they can be interpreted as *expected misclassification loss*, aggregating over all possible **skews** (class prevalence or cost proportion). 
- From the latter perspective they differ only in the *scale* on which skews are measured. 


### Cost-sensitive classification

- Loss at a particular operating point: 

$$Q(t; \pi , c_0, c_1) =  c_0 \pi (1 -F_0(t)) + c_1 (1-\pi) F_1(t)$$

- Re-parametrising on an arithmetic scale: 

$$Q(t; \pi , b, c) =  b\left[c \pi (1 -F_0(t)) + (1-c) (1-\pi) F_1(t)\right]$$

- Assuming $b, c$ independent: 

$$L = \mathbb{E}[b]\int_0 ^1 \left[c \pi (1 -F_0(t)) + (1-c) (1-\pi) F_1(t)\right] dc $$


### Deriving squared loss

$$L = \mathbb{E}[b]\int_0 ^1 \left[c \pi (1 -F_0(t)) + (1-c) (1-\pi) F_1(t)\right] dc $$

- Assuming a calibrated probabilistic classifier, then $t=c$ is optimal; with a budget $\mathbb{E}[b]=2$: 

$$ L = \pi \int_0^1 s^{2} f_0(s) ds + (1-\pi) \int_0^1 (1-s)^{2} f_1(s) ds $$

- This is squared loss, also known as the Brier score.   <!-- .element: class="fragment" -->


### Changing the cost scale

- The starting point is the same: 

$$Q(t; \pi , c_0, c_1) =  c_0 \pi (1 -F_0(t)) + c_1 (1-\pi) F_1(t)$$

- Re-parametrising on a harmonic scale: 

$$Q(t; \pi , d, c) =  d\left[\frac{1}{1-c} \pi (1 -F_0(t)) + \frac{1}{c} (1-\pi) F_1(t)\right]$$

- Assuming $d, c$ independent: 

$$L = \mathbb{E}[d]\int_0 ^1 \left[\frac{1}{1-c} \pi (1 -F_0(t)) + \frac{1}{c} (1-\pi) F_1(t)\right] dc $$


### Deriving log-loss

$$L = \mathbb{E}[d]\int_0 ^1 \left[\frac{1}{1-c} \pi (1 -F_0(t)) + \frac{1}{c} (1-\pi) F_1(t)\right] dc $$

- Assuming a calibrated probabilistic classifier and a budget $\mathbb{E}[d]=1/2$: 

$$ L = \pi/2 \int_0^1 -\ln (1-s) f_0(s) ds + (1-\pi)/2 \int_0^1 -\ln s f_1(s) ds $$

- This is log-loss. <!-- .element: class="fragment" -->


### Illustration

- Calibration: poor (left), perfect (right). 
- Cost scale: arithmetic (blue), harmonic (red). 

![Cost plot](img/BC-LL-left.png)  <!-- .element height="30%" width="30%" -->
![Perfect calibration](img/BC-LL-right.png)   <!-- .element height="30%" width="30%" -->

Log-loss emphasises extreme values of $c$.  <!-- .element: class="fragment" -->


### Sampled cost parameters

![Arithmetic](img/bc.png)  <!-- .element height="40%" width="40%" -->
![Harmonic](img/dc.png)   <!-- .element height="40%" width="40%" -->

Left: arithmetic; right: harmonic.


### More here

[Flach, P., 2015. Cost-Sensitive Classification Meets Proper Scoring Rules. Second international workshop on learning over multiple contexts (LMCE'15) at ECML-PKDD 2015.](http://dmip.webs.upv.es/LMCE2015/Papers/LMCE_2015_submission_5.pdf)
