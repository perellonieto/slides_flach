## Why should you care about measurement?

Measurements are relevant in machine learning and discovery science for at least two reasons: 
- *Features* are often are measurements on some scale, and we need to understand the properties of the scale, admissible operations, etc.
  - e.g., the arithmetic mean is not always appropriate. 
- *Performance metrics* are also measurements, and hence the same applies! 


### Measuring things is easy, right?

Using a calibrated measuring instrument (e.g., a ruler) we map the object under measurement to a real number.

This mapping $M$ should be such that if I *concatenate* two objects $a \circ b$ there should be a corresponding numerical operation $\oplus$ on the measurements (e.g., addition), establishing a **scale**. 

![M1](img/M1.png)   <!-- .element height="50%" width="50%" -->


### If I can measure, I can average

*Averaging* can also be understood in terms of concatenation: we are looking for $M(c)$ for some $c$ such that $M(a \circ b) = M(c \circ c)$.

Clearly this gives a value in between $M(a)$ and $M(b)$. Other properties depend on the scale used. 

Let's look at some examples.


### Last weekend...

...I made two cycling trips. 
On Saturday my average speed was 20 km/h, 
on Sunday it was 30 km/h. 

- I calculated my overall average speed as 24 km/h. 
What can I say about the two trips?   <!-- .element: class="fragment" -->
  1. They were equally far.   <!-- .element: class="fragment" -->
  2. They were equally long.   <!-- .element: class="fragment" -->
  3. Neither.   <!-- .element: class="fragment" -->


### The weekend before...

...I also made two trips with average speeds 20 km/h and 30 km/h. 

- This time I calculated my overall average speed as 25 km/h. 
What can I say about these two trips? 
  1. They were equally far.   <!-- .element: class="fragment" -->
  2. They were equally long.   <!-- .element: class="fragment" -->
  3. Neither.   <!-- .element: class="fragment" -->


### Means and weighted means

**Segment 1**: distance $d_1$, time $t_1$, velocity $v_1=d_1/t_1$
**Segment 2**: distance $d_2$, time $t_2$, velocity $v_2=d_2/t_2$
**Overall**: distance $d=d_1+d_2$, time $t=t_1+t_2$, velocity $v=(d_1+d_2)/(t_1+t_2)$

- $t_1=t_2 \Rightarrow v = (v_1+v_2)/2 = A(v_1,v_2)$ <!-- .element: class="fragment" -->
  - or in general: $v = {\color{red}{(t_1/t)}}\cdot v_1 + {\color{red}{(t_2/t)}}\cdot v_2$ <!-- .element: class="fragment" -->
- $d_1=d_2 \Rightarrow v = 2/(1/v_1+1/v_2) = H(v_1,v_2)$ <!-- .element: class="fragment" -->
  - or in general: $1/v = {\color{red}{(d_1/d)}}\cdot 1/v_1 + {\color{red}{(d_2/d)}}\cdot 1/v_2$ <!-- .element: class="fragment" -->


### What's my point? 

- When we average ratios we are making assumptions: 
  - the arithmetic mean assumes **denominators** stay the same; 
  - the harmonic mean assumes **numerators** stay the same. 

Alternatively, we can use *weighted* means (either arithmetic or harmonic). 


### A machine learning example (1)

I apply a binary classifier on two test sets A and B. 

The classifier achieves 70% and 80% *accuracy* 
(the proportion of correctly classified instances).

When I combine A and B into a single test set
and re-run the classifier its accuracy is 75%.
What can I say about A and B?   <!-- .element: class="fragment" -->
  1. They contain the same number of instances.   <!-- .element: class="fragment" -->
  2. They contain the same number of positives.   <!-- .element: class="fragment" -->
  3. Both.   <!-- .element: class="fragment" -->
  4. Neither.   <!-- .element: class="fragment" -->


### A machine learning example (2)

I apply a binary classifier on two test sets A and B. 
 
The classifier achieves 70% and 80% *recall* 
(the proportion of correctly classified positives).

When I combine A and B into a single test set
and re-run the classifier its recall is 75%.
What can I say about A and B?   <!-- .element: class="fragment" -->
  1. They contain the same number of instances.   <!-- .element: class="fragment" -->
  2. They contain the same number of positives.   <!-- .element: class="fragment" -->
  3. Both.   <!-- .element: class="fragment" -->
  4. Neither.   <!-- .element: class="fragment" -->


### A machine learning example (3)

I apply a binary classifier on two test sets A and B. 
 
The classifier achieves 70% and 80% *precision* 
(the proportion of correct positive predictions).

When I combine A and B into a single test set
and re-run the classifier its precision is 75%.
What can I say about A and B?   <!-- .element: class="fragment" -->
  1. They contain the same number of instances.   <!-- .element: class="fragment" -->
  2. They contain the same number of positives.   <!-- .element: class="fragment" -->
  3. Both.   <!-- .element: class="fragment" -->
  4. Neither.   <!-- .element: class="fragment" -->


### What's my point? 

- Using the (unweighted) arithmetic mean on performance metrics needs to be justified: 
  - for accuracy the test sets need to be equal in size; 
  - for recall the class distributions need to be the same;
  - for precision the proportions of positive predictions need to be the same. 

Note that the latter is much harder to achieve. 
Arithmetically averaging precision is therefore rarely justified. 
The same holds for F-score (more on that later).    <!-- .element: class="fragment" -->


### Outline of my talk

----

## Scales, units, dimensions and types

Perhaps surprisingly, there isn't a definitive framework to link all these concepts together. 
We'll look at it from four perspectives: 

- The mathematical perspective
- The physics perspective
- Levels of measurement
- The computer science perspective


### The mathematical perspective: scales

Most means $M(x,y)$ are *quasi-arithmetic*: 
there exists a **change of scale** $g: \mathbb{R} \rightarrow \mathbb{R}$ such that 
$M(x,y) = g^{-1}(A(g(x),g(y)))$. 

Mean | $M(x,y)$ | $g(x)$ 
---|---|---
Arithmetic | $(x+y)/2$ | $x$ 
Harmonic | $2/(1/x+1/y)$ | $1/x$ 
Geometric | $\sqrt{xy}$ | $\ln x$ 
Quadratic | $\sqrt{(x^2+y^2)/2}$ | $x^2$ 
Generalised | $\sqrt[p]{(x^p+y^p)/2}$ | $x^p$ 


### Comparing means

![Isometrics plot](img/means.png)  <!-- .element height="40%" width="40%" -->

Top (sensitive to small values) to bottom (sensitive to large values): harmonic, geometric, arithmetic, quadratic. 


### The physics perspective: units and dimensions

- Physical quantities have an associated **dimension** (Fourier, 1822). 
- In order to be compared and aggregated, quantities need to be *commensurable* (have the same dimension). 
  - Aggregation is usually additive, but this is a choice.
- Incommensurable quantities may be multiplied and divided, giving new derived dimensions. 
- E.g. pressure has dimension $M L^{-1} T^{-2}$
  - SI units Pascal = Newton/m$^2$ = kg/(m*s$^2$).


### Dimensionless quantities can be problematic

- Angle is a ratio of lengths, hence dimensionless; but it has a unit (radians, degrees). This leads to angular velocity having dimension $T^{-1}$, which is odd. 
  - could choose $L_x$, $L_y$, $L_z$ as distinct dimensions. 
- Functions such as $\exp$`, `$\sin$ etc. can only take and result in dimensionless quantities. 
  - e.g., $\log V$ where $V$ has dimension $L^3$ should be thought of as $\log (V/v)$ where $v$ is an arbitrary unit of volume. 


### In ML, "dimensionless" quantities are everywhere

- relative frequencies, probabilities, evaluation metrics...
- Still, we treat derived quantities such as $\log p$ as having a unit (bits, log-likelihood). 
- We also have different concatenation operators, such as $p_1+p_2$ for the union of mutually exclusive events, $p_1 \cdot p_2$ for the joint probability of independent events. 


### Stevens' levels of measurement (1946)

[![Stevens (1946)](img/Stevens1946.gif)  <!-- .element height="20%" width="20%" -->](https://www.jstor.org/stable/1671815)
![Stevens' levels](img/StevensTable.png)  <!-- .element height="65%" width="65%" -->


### Levels of measurement

- Nominal: no order, no scale
- Ordinal: order, no scale
- Interval: differences are meaningful, but no zero
- Ratio: fixed zero, ratios are also meaningful
- Transformed scales: e.g. log-ratio

There should be more? E.g. scales bounded from both sides. <!-- .element: class="fragment" -->


### The computer science perspective: types and operations

[![xpecBits Haskell code](img/xpecBits.tiff)  <!-- .element height="80%" width="80%" -->](https://repl.it/repls/ThoughtfulWarlikeRuntimelibrary)

----

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

----

## Squared loss and Log-loss

- These are most commonly used to evaluate *probability estimates* against 'ideal' probabilities 0 and 1. 
- Alternatively, they can be interpreted as *expected misclassification loss*, aggregating over all possible **skews** (class prevalence or cost proportion). 
- From the latter perspective they differ only in the *scale* on which skews are measured. 


### Notation

Symbol | Range | Meaning
---|---|---
`$c_{+}$`, `$c_{-}$` | `$\mathbb{R}^+$` | cost of misclassifying a positive/negative
`$c=\frac{c_{+}}{c_{+}+c_{-}}$` | `$[0,1]$` | cost proportion
`$\pi$` | `$[0,1]$` | proportion of positives

`$F_{+}(t)$`, `$F_{-}(t)$`: true/false positive rate at threshold $t$, interpreted as a cumulative distribution

`$f_{+}(s)$`, `$f_{-}(s)$`: score densities for positive/negative class


### Cost-sensitive classification

- Loss at a particular operating point: 

`$$Q(t; \pi , c_{+}, c_{-}) =  c_{+} \pi (1 -F_{+}(t)) + c_{-} (1-\pi) F_{-}(t)$$`

- Re-parametrising on an *arithmetic scale*:

`$$Q(t; \pi , b, c) =  b\left[c \pi (1 -F_{+}(t)) + (1-c) (1-\pi) F_{-}(t)\right]$$`

- Assuming $b, c$ independent: 

`$$L = \mathbb{E}[b]\int_0 ^1 \left[c \pi (1 -F_{+}(t)) + (1-c) (1-\pi) F_{-}(t)\right] dc $$`


### Deriving squared loss

`$$L = \mathbb{E}[b]\int_0 ^1 \left[c \pi (1 -F_{+}(t)) + (1-c) (1-\pi) F_{-}(t)\right] dc $$`

- Assuming a calibrated probabilistic classifier, then $t=c$ is optimal; with a budget $\mathbb{E}[b]=2$: 

`$$ L = \pi \int_0^1 s^{2} f_{+}(s) ds + (1-\pi) \int_0^1 (1-s)^{2} f_{-}(s) ds $$`

- This is squared loss, also known as the Brier score.   <!-- .element: class="fragment" -->


### Changing the cost scale

- The starting point is the same: 

`$$Q(t; \pi , c_{+}, c_{-}) =  c_{+} \pi (1 -F_{+}(t)) + c_{-} (1-\pi) F_{-}(t)$$`

- Re-parametrising on a *harmonic scale*: 

`$$Q(t; \pi , d, c) =  d\left[\frac{1}{1-c} \pi (1 -F_{+}(t)) + \frac{1}{c} (1-\pi) F_{-}(t)\right]$$`

- Assuming $d, c$ independent: 

`$$L = \mathbb{E}[d]\int_0 ^1 \left[\frac{1}{1-c} \pi (1 -F_{+}(t)) + \frac{1}{c} (1-\pi) F_{-}(t)\right] dc $$`


### Deriving log-loss

`$$L = \mathbb{E}[d]\int_0 ^1 \left[\frac{1}{1-c} \pi (1 -F_{+}(t)) + \frac{1}{c} (1-\pi) F_{-}(t)\right] dc $$`

- Assuming a calibrated probabilistic classifier and a budget $\mathbb{E}[d]=1/2$: 

`$$ L = \pi/2 \int_0^1 -\ln (1-s) f_{+}(s) ds + (1-\pi)/2 \int_0^1 -\ln s f_{-}(s) ds $$`

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

----

## Towards *Measurement Theory* for ML

![M1](img/M1.png)

*Concatenate then measure* gives the same result as **measure then calculate**. 


### Measurements on Confusion Matrices

$$
\begin{array}{lccc}
\hline
           & \text{Predicted}\ + & \text{Predicted}\ - &     \\\\ \hline
\text{Actual}\ + & TP_i            & FN_i            & Pos_i \\\\
\text{Actual}\ - & FP_i            & TN_i            & Neg_i \\\\
           & PPos_i          & PNeg_i          & N_i  \\\\ \hline
\end{array}
$$

Assume we have two of these, $C_1$ and $C_2$ 
(e.g. as obtained in two-fold cross-validation) 
and their cell-wise sum $C_1 \circ C_2$. 


### Accuracy

$$
\begin{align}
acc(C_i) &= \frac{TP_i+TN_i}{N_i}, i=1,2 \\\\
acc(C_1 \circ C_2) &= \frac{\sum_i TP_i+\sum_i TN_i}{\sum_i N_i} \\\\
&= \frac{N_1}{N}acc(C_1) + \frac{N_2}{N}acc(C_2) 
\end{align}
$$

This is a weighted average where the weights do not depend on the performance of the two models (and can be made uniform, as in cross-validation). 


### True/false positive rate, recall

$$
\begin{align}
tpr(C_i) &= \frac{TP_i}{Pos_i}, i=1,2 \\\\
tpr(C_1 \circ C_2) &= \frac{\sum_i TP_i}{\sum_i Pos_i} \\\\
&= \frac{Pos_1}{Pos}tpr(C_1) + \frac{Pos_2}{Pos}tpr(C_2) 
\end{align}
$$

Again, a weighted average with weights that can be determined in advance
(or made uniform, as in stratified cross-validation). 


### Precision is different 

$$
\begin{align}
prec(C_i) &= \frac{TP_i}{PPos_i}, i=1,2 \\\\
prec(C_1 \circ C_2) &= \frac{\sum_i TP_i}{\sum_i PPos_i} \\\\
&= \frac{PPos_1}{PPos}prec(C_1) + \frac{PPos_2}{PPos}prec(C_2) 
\end{align}
$$

Now, *the weights are themselves measurements*, 
without which the concatenated value cannot be calculated from the component values. 


### Hence, F-score is different 

$$
\begin{align}
Fscore(C_1 \circ C_2) &= \frac{Pos_1+PPos_1}{Pos+PPos}Fscore(C_1) \nonumber \\\\ &+ \frac{Pos_2+PPos_2}{Pos+PPos}Fscore(C_2) 
\end{align}
$$

- [Flach, P., 2019. Performance Evaluation in Machine Learning: The Good, The Bad, The Ugly and The Way Forward. In 33rd AAAI Conference on Artificial Intelligence.](https://aaai.org/ojs/index.php/AAAI/article/view/5055)

----

## Outlook

Proper treatment of performance evaluation in machine learning (and AI more generally) requires a sophisticated model with the following components: 
- *Measurement theory* for the observable performance indicators; 
- *Latent-variable models* for the unobservable performance indicators of interest; 
- *Causal models* to allow for counterfactual reasoning. 


### Acknowledgements

Part of this work was funded through a [project with the Alan Turing Institute](https://www.turing.ac.uk/research/research-projects/measurement-theory-data-science-and-ai). 

Many thanks to Jose Hernandez-Orallo, Kacper Sokol, Meelis Kull, Tom Diethe, Yu Chen, Telmo Filho, Hao Song and many others.  <!-- .element: class="fragment" -->

