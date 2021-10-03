## Why should you care about measurement?

Measurements are relevant in data science and AI for at least two reasons:
- *Features* are often are measurements on some scale, which dictates admissible statistics and operations.
  - E.g., taking the expectation assumes a linear scale.
- *Performance metrics* are also measurements, and hence the same applies. 

Perhaps surprisingly, there are many open questions! <!-- .element: class="fragment" -->


### Performance measurement is easy...

If I split a data set in two or more parts, is a classifier's *accuracy* on the entire data set equal to the average* of the accuracies on the parts? 

Yes -- provided the parts are of equal size (e.g., cross-validation).  <!-- .element: class="fragment" -->

What about per-class recall?  <!-- .element: class="fragment" -->

Yes -- provided the parts have the same class distribution (e.g., stratified CV). <!-- .element: class="fragment" -->

*To be precise: the arithmetic mean. <!-- .element: class="fragment" -->


### ...or is it?

Is a classifier's *precision* on the entire data set equal to the average of the precisions on the parts? 

**IT IS NOT!**  <!-- .element: class="fragment" -->

Unless the classifier's predictions are equally distributed on each part, which is (a) very unlikely, and (b) not under the experimenter's control.  <!-- .element: class="fragment" -->

The same applies a fortiori to F-score, which aggregates recall and precision.  <!-- .element: class="fragment" -->


### An early result: Precision-Recall-Gain curves

![from ROC via PR to PRG](img/PRG.png)

[Flach, P. and Kull, M., 2015. Precision-recall-gain curves: PR analysis done right. NIPS 2015.](http://people.cs.bris.ac.uk/~flach/PRGcurves)


### Measuring things is easy, right?

Using a calibrated measuring instrument (e.g., a ruler) we map the object under measurement $a$ to a real number $M(a)$.

This mapping should be such that if I *concatenate* two objects $a \circ b$ there should be a corresponding numerical operation $\oplus$ on the measurements (e.g., addition), establishing a **scale**.

![M1](img/M1.png)   <!-- .element height="50%" width="50%" -->


### If I can concatenate, I can average

*Averaging* can also be understood in terms of concatenation: we are looking for $M(c)$ for some $c$ such that $M(a \circ b) = M(c \circ c)$.

Clearly this gives a value in between $M(a)$ and $M(b)$. Other properties depend on the **scale** used.

Let's look at some examples.


### Last weekend...

...I went on two bicycle rides.
On Saturday my average speed was 20 km/h,
on Sunday it was 30 km/h.

- Concatenating the two trips, I calculated my overall average speed as 25 km/h.
What can I say about the two trips?
  1. They were equally far (in distance).
  2. They were equally long (in time).  **CORRECT!** <!-- .element: class="fragment" -->
  3. Neither.   


### The weekend before...

...I also did two rides with average speeds 20 km/h and 30 km/h.

- This time I calculated my overall average speed as 24 km/h.
What can I say about these two trips?
  1. They were equally far (in distance).  **CORRECT!** <!-- .element: class="fragment" -->
  2. They were equally long (in time).
  3. Neither.   


### Means and weighted means

**Trip 1**: distance $d_1$, time $t_1$, velocity $v_1=d_1/t_1$.

**Trip 2**: distance $d_2$, time $t_2$, velocity $v_2=d_2/t_2$.

**Overall**: distance $d=d_1+d_2$, time $t=t_1+t_2$, velocity $v=(d_1+d_2)/(t_1+t_2)$.

- $t_1=t_2 \Rightarrow v = (v_1+v_2)/2 = AM(v_1,v_2)$ <!-- .element: class="fragment" -->
  - or in general: $v = {\color{red}{(t_1/t)}}\cdot v_1 + {\color{red}{(t_2/t)}}\cdot v_2$ <!-- .element: class="fragment" -->
- $d_1=d_2 \Rightarrow v = 2/(1/v_1+1/v_2) = HM(v_1,v_2)$ <!-- .element: class="fragment" -->
  - or in general: $1/v = {\color{red}{(d_1/d)}}\cdot 1/v_1 + {\color{red}{(d_2/d)}}\cdot 1/v_2$ <!-- .element: class="fragment" -->


### What's my point?

- When we average ratios we are making assumptions:
  - the arithmetic mean assumes **denominators** stay the same;
  - the harmonic mean assumes **numerators** stay the same.

Alternatively, we can use *weighted* means (either arithmetic or harmonic).


### Audience participation! Q1

I apply a binary classifier on two test sets A and B.

On A and B separately, the classifier achieves 70% and 80% *accuracy*
(the proportion of correctly classified instances).

- When I combine A and B into a single test set
and re-run the classifier its accuracy is 75%.
What can I say about A and B?   <!-- .element: class="fragment" -->
  1. They contain the same number of instances.   <!-- .element: class="fragment" -->
  2. They contain the same number of positives.   <!-- .element: class="fragment" -->
  3. Both.   <!-- .element: class="fragment" -->
  4. Neither.   <!-- .element: class="fragment" -->


### Audience participation! Q2

(same question, but now for recall = true positive rate)

On two other test sets C and D, the classifier achieves 70% and 80% *recall*
(the proportion of correctly classified positives).

- When I combine C and D into a single test set
and re-run the classifier its recall is 75%.
What can I say about C and D?
  1. They contain the same number of instances.
  2. They contain the same number of positives.
  3. Both.
  4. Neither.


### Audience participation! Q3

(same question, but now for precision)

On yet other test sets E and F, the classifier achieves 70% and 80% *precision*
(the proportion of correct positive predictions).

- When I combine E and F into a single test set
and re-run the classifier its precision is 75%.
What can I say about E and F?
  1. They contain the same number of instances.
  2. They contain the same number of positives.
  3. Both.
  4. Neither.


### Correct answers

(Q1: 1) $acc(A \circ B) = AM(acc(A),acc(B))$ implies A and B contain *the same number of instances*.

(Q2: 2) $tpr(C \circ D) = AM(tpr(C),tpr(D))$ implies C and D contain *the same number of positives*.

(Q3: 4) $prec(E \circ F) = AM(prec(E),prec(F))$ implies **the classifier makes the same number of positive predictions on E and F**.


### What's my point?

- Using the (unweighted) arithmetic mean on performance metrics needs to be **justified**:
  - for accuracy the test sets need to be equal in size (as in cross-validation);
  - for recall the class distributions need to be the same (stratified CV);
  - for precision the proportions of positive predictions need to be the same (??).

Arithmetically averaging precision is rarely justified.
The same holds for F-score (more on that later).    <!-- .element: class="fragment" -->


### What I will talk about

- [Changes of scale](#/2)
  - Precision-recall curves and how to fix them
  - How log-loss relates to squared loss
- [Scales, units, dimensions and types](#/3)
  - Perspectives from psychology, physics and computer science
- [You can't always measure what you want](#/4)
  - Latent variable models
  - Causal models
- [Conclusions and outlook](#/5)

----

## Changes of scale

Most means $M(x,y)$ are *quasi-arithmetic*:
there exists a **change of scale** $g: \mathbb{R} \rightarrow \mathbb{R}$ such that
$M(x,y) = g^{-1}(AM(g(x),g(y)))$.

Mean | $M(x,y)$ | $g(x)$
---|---|---
Arithmetic | $(x+y)/2$ | $x$
Harmonic | $2/(1/x+1/y)$ | $1/x$
Geometric | $\sqrt{xy}$ | $\ln x$
Quadratic | $\sqrt{(x^2+y^2)/2}$ | $x^2$
Generalised | $\sqrt[p]{(x^p+y^p)/2}$ | $x^p$


### Comparing means

![Isometrics plot](img/means.png)  <!-- .element height="75%" width="75%" -->

Towards `max` (`min`) the mean emphasises large (small) values.


### Change of scale examples in ML

1. *Precision-recall curves* have many issues that can be solved with a change of scale.
2. Loss measures such as *log-loss* and *squared loss* can be related to each other through a change of scale.


## ROC curve and precision-recall curve

![PR curve](img/fig1-left.png) <!-- .element height="40%" width="40%" -->
![PRG curve](img/fig1-right.png) <!-- .element height="40%" width="40%" -->

In contrast to ROC curves, PR curves don't allow linear interpolation and don't have a meaningful area under the curve.    <!-- .element: class="fragment" -->


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

$$1/F_{\beta} = \frac{\beta^2}{\beta^2+1} 1/rec + \frac{1}{\beta^2+1} 1/prec$$


### Fixing PR curves through scale transformations

1. Take reciprocals:
$$
\begin{align}
prec &= TP/(TP+FP) \rightarrow 1/prec = 1+FP/TP \\\\
rec  &= TP/(TP+FN) \rightarrow 1/rec  = 1+FN/TP \\\\
\\ \\\\
\end{align}
$$
2. Clip $[1,\infty]$ to $[1,1/\pi]$ to exlude overly small values of precision/recall.
$$
\begin{align}
\\ \\\\
\end{align}
$$  <!-- .element: class="fragment" -->
3. Map $[1,1/\pi]$ back to unit interval:
$$
\begin{align}
precG &= \frac{prec-\pi}{(1-\pi)prec} = 1 - \frac{\pi}{1-\pi} FP/TP \\\\
recG  &= \frac{rec-\pi}{(1-\pi)rec} = 1 - \frac{\pi}{1-\pi} FN/TP \\\\
\end{align}
$$  <!-- .element: class="fragment" -->


### Et voila!

![PR curve](img/fig2-left.png) <!-- .element height="40%" width="40%" -->
![PRG curve](img/fig2-right.png) <!-- .element height="40%" width="40%" -->

 - area under PRG curve $\propto$ *expected $F_1$ score*;
 - convex hull can be used to determine the *optimal operating point* for a given $\beta^2$.


 ### More here

 [Flach, P. and Kull, M., 2015. Precision-recall-gain curves: PR analysis done right. NIPS 2015.](http://people.cs.bris.ac.uk/~flach/PRGcurves)

![from ROC via PR to PRG](img/PRG.png)


## Squared loss and Log-loss

- These are most commonly used to evaluate *probability estimates* against 'ideal' probabilities 0 and 1.
- Alternatively, they can be interpreted as *expected misclassification loss*, aggregating over all possible **skews** (class prevalence or cost proportion).
- From the latter perspective they differ only in the *scale* on which skews are measured.


### Cost-sensitive classification

- Let `$c_+$` be the cost of misclassifying a positive (i.e., a false negative)
and `$c_-$` the cost of misclassifying a negative (i.e., a false positive).
- `$c=\frac{c_{+}}{c_{+}+c_{-}}$` is the *cost proportion*.
- Two ways to derive `$c_+,c_-$` from $c$:
  - set a fixed budget `$b=c_++c_-$`, then `$c_+=bc$` and `$c_-=b(1-c)$`.
  - set a fixed budget `$d=1/(1/c_++1/c_-)$`, then `$c_+=d/(1-c)$` and `$c_-=d/c$`.
- Varying $c$ uniformly in $[0,1]$ and setting the decision threshold equal to $c$, the first gives squared loss as expected loss, the second log-loss.    <!-- .element: class="fragment" -->


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

- Let $b$ be the *arithmetic* sum of `$c_{+}, c_{-}$`:

`$$Q(t; \pi , b, c) =  b\left[c \pi (1 -F_{+}(t)) + (1-c) (1-\pi) F_{-}(t)\right]$$`

- Assuming $b, c$ independent:

`$$L = \mathbb{E}[b]\int_0 ^1 \left[c \pi (1 -F_{+}(t)) + (1-c) (1-\pi) F_{-}(t)\right] dc $$`


### Deriving squared loss

`$$L = \mathbb{E}[b]\int_0 ^1 \left[c \pi (1 -F_{+}(t)) + (1-c) (1-\pi) F_{-}(t)\right] dc $$`

- Assuming a calibrated probabilistic classifier, then $t=c$ is optimal; with a budget $\mathbb{E}[b]=2$:

`$$ L = \pi \int_0^1 s^{2} f_{+}(s) ds + (1-\pi) \int_0^1 (1-s)^{2} f_{-}(s) ds $$`

- This is squared loss, also known as the Brier score.


### Changing the cost scale

- Starting again from loss at threshold $t$:

`$$Q(t; \pi , c_{+}, c_{-}) =  c_{+} \pi (1 -F_{+}(t)) + c_{-} (1-\pi) F_{-}(t)$$`

- Let $d$ be the *harmonic* sum of `$c_{+}, c_{-}$`:

`$$Q(t; \pi , d, c) =  d\left[\frac{1}{1-c} \pi (1 -F_{+}(t)) + \frac{1}{c} (1-\pi) F_{-}(t)\right]$$`

- Assuming $d, c$ independent:

`$$L = \mathbb{E}[d]\int_0 ^1 \left[\frac{1}{1-c} \pi (1 -F_{+}(t)) + \frac{1}{c} (1-\pi) F_{-}(t)\right] dc $$`


### Deriving log-loss

`$$L = \mathbb{E}[d]\int_0 ^1 \left[\frac{1}{1-c} \pi (1 -F_{+}(t)) + \frac{1}{c} (1-\pi) F_{-}(t)\right] dc $$`

- Assuming a calibrated probabilistic classifier and a budget $\mathbb{E}[d]=1/2$:

`$$ L = \pi/2 \int_0^1 -\ln (1-s) f_{+}(s) ds + (1-\pi)/2 \int_0^1 -\ln s f_{-}(s) ds $$`

- This is log-loss.


### Cost curves

- Calibration: poor (left), perfect (right).
- Cost scale: arithmetic (blue), harmonic (red).

![Cost plot](img/BC-LL-left.png)  <!-- .element height="40%" width="40%" -->
![Perfect calibration](img/BC-LL-right.png)   <!-- .element height="40%" width="40%" -->

Log-loss emphasises extreme values of $c$.  <!-- .element: class="fragment" -->


### More here

[Flach, P., 2015. Cost-Sensitive Classification Meets Proper Scoring Rules. Second international workshop on learning over multiple contexts (LMCE'15) at ECML-PKDD 2015.](http://dmip.webs.upv.es/LMCE2015/Papers/LMCE_2015_submission_5.pdf)

----

## Scales, units, dimensions and types

So we've seen the use of a mathematical treatment of scales. What about things like units and dimensions?

Perhaps surprisingly, there doesn't seem to be a definitive framework to link all these concepts together.
We'll look at it from a few more perspectives:

- Levels of measurement
- The physics perspective
- The computer science perspective


## Levels of measurement

![Stevens (1946)](img/Stevens1946.gif)  <!-- .element height="20%" width="20%" -->
![Stevens' levels](img/StevensTable.png)  <!-- .element height="65%" width="65%" -->

Early proposal from a psychologist [(Stevens, 1946)](https://www.jstor.org/stable/1671815), still influential although somewhat rigid and limited.


### Stevens' typology

Scale type | Description | Transformations
---|---|---
Nominal | no order, no unit | permutation
Ordinal | order, no unit | monotone
Interval | can choose unit and zero | affine
Ratio | fixed zero, can choose unit | linear

The appropriate scale type is determined by the transformation furthest down the list which is still "meaningful".


### Admissible statistics

Scale type | Statistics
---|---|---
Nominal | mode
Ordinal | median, quantile, range
Interval | arithmetic mean, variance
Ratio | geometric mean, coefficient of variation

Each scale type inherits statistics from levels above.


### Levels of measurement: discussion

1. Many statisticians challenge the rigid connection between scale types and admissible statistics.
  - E.g., Spearman's rank correlation statistic would not be admissible for ordinal data.
2. Many common scales do not fit well:
  - scales bounded from both sides;
  - scales with a fixed unit;
  - integer measurements.

Such scales abound in machine learning!  <!-- .element: class="fragment" -->


### Alternative typologies

[Mosteller and Tukey (1977)](https://books.google.co.uk/books?id=n4dYAAAAMAAJ):
*Names*,
*Grades* (e.g., beginner, intermediate, advanced),
*Ranks* (1, 2, ...),
*Counted fractions* (e.g., percentages),
*Counts* (non-negative integers),
*Amounts* (non-negative real numbers),
*Balances* (unbounded, positive or negative values).

[Chrisman (1998)](https://doi.org/10.1559/152304098782383043):
*Nominal*,
*Graded membership* (e.g., fuzzy sets),
*Ordinal*,
*Interval*,
*Log-interval*,
*Extensive ratio*,
*Cyclical ratio* (e.g., angles or time of day)
*Derived ratio*,
*Counts*,
*Absolute* (e.g., probabilities).


## The physics perspective

- Physical quantities have an associated **dimension** [(Fourier, 1822)](https://books.google.co.uk/books?id=No8IAAAAMAAJ&pg=PA128#v=onepage&q&f=false).
- In order to be compared and added or subtracted, quantities need to be *commensurable* (have the same dimension).
- Incommensurable quantities may be multiplied and divided, giving new derived dimensions.
  - E.g. pressure has dimension $M L^{-1} T^{-2}$
  - SI units Pascal = Newton/m$^2$ = kg/(m*s$^2$).


### Dimensional analysis: discussion

- Dimensions can cancel, leading to *dimensionless quantities*.
  - E.g., angle is a ratio of lengths, hence dimensionless; but it has units (radians, degrees).
  - Sometimes units also cancel, e.g. ABV has unit ml ethanol per 100 ml liquid (percentage).
- Transcendental functions ($\exp$, $\sin$ etc.) require dimensionless and *unitless* quantities.
  - E.g., $\log V$ where $V$ has dimension $L^3$ should be thought of as $\log (V/v)$ where $v$ is the unit of $V$.


## How do we build on this in ML?

- Both perspectives (levels of measurement and dimensional analysis) have interesting features but appear overly focused on establishing a 'true' scale type or dimension for a measurement.
  - Machine learning needs something more *flexible*.
  - In particular, a better treatment of "dimensionless" quantities which are everywhere you look!
    - relative frequencies, probabilities, evaluation metrics...


### Why we need flexibility

- Let $p$ be the parameter of a Bernoulli distribution (e.g, coin comes up head with probability $p$).
Then
  - the *variance* of this distribution (i.e., spread around the mean) is $p(1-p)$;
  - its *entropy* (i.e., information content of a coin toss on average) is $-p \log p - (1-p) \log (1-p)$.
- At first sight these seem very different things, and hence don't share scale, unit, or dimension.   <!-- .element: class="fragment" -->
  - However, I'm going to put forward an argument that they can be seen as
different ways of measuring the same thing!   <!-- .element: class="fragment" -->


### Context: proper scoring rules

- *Scoring rule* $\phi(p,y)$ returns the loss of predicting $p$ for class $1$ when the true class is $y$
  - `$\phi : \mathbb{P} \times \{0,1\} \mapsto \mathbb{R}$`
  - often takes the form `$\phi(p,y) = y h(p) + (1-y) h(1-p)$`
- *Expected score* $s(p,q) = \mathbb{E}_{y \sim q} \phi(p,y)$
  - `$s : \mathbb{P} \times \mathbb{P} \mapsto \mathbb{R}$`
  - with the above form of $\phi$: `$s(p,q) = q h(p) + (1-q) h(1-p)$`


### **Generalised** divergence and entropy

- *Divergence* $d(p,q) = s(p,q) - s(q,q)$
  - `$d : \mathbb{P} \times \mathbb{P} \mapsto \mathbb{R}$`.
  - The scoring rule is (strictly) *proper* if $p=q$ is (sole) minimiser of $d(p,q)$ for a given $q$.
  - NB. this turns an interval scale into a ratio scale.
- *Entropy* $e(q) = s(q,q)$
  - `$e : \mathbb{P} \mapsto \mathbb{R}$`


### Logarithmic scoring rule

$$
\begin{align}
h(p) &= -\log p  \\\\
\phi(p,y) &= -y \log p - (1-y)\log (1-p)  \\\\
s(p,q) &= -q\log p -(1-q)\log (1-p)  \\\\
\\ \\\\
d(p,q) &= -q\log \frac{p}{q} - (1-q) \frac{1-p}{1-q}  \\\\
e(q) &= -q\log q - (1-q)\log (1-q)  \\\\
\\ \\\\
\end{align}
$$

The last two equations are known as *Kullback-Leibler divergence* and *Shannon entropy*.


### Quadratic scoring rule

$$
\begin{align}
h(p) &= (1-p)^2 \\\\
\phi(p,y) &= y(1-p)^2+(1-y)p^2 \\\\
s(p,q) &= q(1-p)^2+(1-q)p^2 \\\\
\\ \\\\
d(p,q) &= (p-q)^2 \\\\
e(q) &= q(1-q) \\\\
\\ \\\\
\end{align}
$$

This scoring rule is also known as the *Brier score* [(Brier, 1950)](https://web.archive.org/web/20171023012737/https://docs.lib.noaa.gov/rescue/mwr/078/mwr-078-01-0001.pdf).


### And therefore...

- Bernoulli variance and Shannon entropy are both realisations of generalised entropy, using different scoring rules.
  - It would therefore make sense to treat them as having the same "type", at least from this perspective.
- BTW Not a big surprise for (decision) tree lovers, as
  - Bernoulli variance aka Gini index is one way of measuring impurity of a node (as used in CART);
  - Shannon entropy is another (as used in ID3 and C4.5).


### Scoring rules in a typed functional language

[![Scoring rules](img/genEntropy.png)  <!-- .element height="70%" width="70%" -->](https://repl.it/repls/KeyBewitchedRoute)


### Shannon entropy as expected number of bits

[![xpecBits Haskell code](img/xpecBits.png)  <!-- .element height="80%" width="80%" -->](https://repl.it/repls/ThoughtfulWarlikeRuntimelibrary)


### What's my point?

- *Abstract data types* are more flexible than dimensions or scale types as they can be adapted to the situation of interest.
  - provide relevant *meta-data* about measurements
  - link to useful *operations*.
- In particular, **higher-order functional languages** such as Haskell allow reasoning with and about types.
  - This provides a formal language and logic for measurement meta-data.
- The challenge is to develop a generally agreed ["Systeme international"](https://en.wikipedia.org/wiki/International_System_of_Units) of ML measurements.

----

## And finally...

- You can't always measure what you want!
  - Latent variable models
  - Causal models


## Latent variable models

- Psychologists have long understood that people's abilities (and the difficulty of a task) are *not directly observable* and need to be estimated.
  - Item-response theory, factor analysis
- We can adapt those models to machine learning, to estimate **ability** of classifiers as well as **difficulty** of instances and datasets.


### Beta-IRT

![Beta-IRT](img/BIRT.png)  <!-- .element height="40%" width="40%" -->
![ICC](img/beta_ICC_discr_a2.png)  <!-- .element height="44%" width="44%" -->

$E[p_{ij}|\delta_j,a_j] = \frac{1}{1+\left(\frac{\delta_i}{\theta_j}\cdot\frac{1-\theta_j}{1-\delta_i} \right)^{a_j}}$


### Adaptive testing

Use a trained IRT model to evaluate a new classifier on a small number of datasets.

1. Start with initial guess of classifier ability.
2. Choose next dataset using an *item selection criterion*.
3. Evaluate classifier and update ability estimation.
4. Repeat until stopping criterion is achieved.


### CAT results

![CAT](img/CAT.png)  <!-- .element height="80%" width="80%" -->


### More here

- [Chen, Y., Prudencio, R.B., Diethe, T. and Flach, P., 2019. $\beta^3$-IRT: A New Item Response Model and its Applications. AISTATS 2019.](http://proceedings.mlr.press/v89/chen19b.html)
- [Song, H., and Flach, P., 2020. Towards Efficient and Robust Model Benchmarks with Item Response Theory and Adaptive Testing. Evaluating Progress in AI workshop at ECAI 2020.](http://dmip.webs.upv.es/EPAI2020/papers/EPAI_2020_paper_7.pdf)


## Causal models

Ultimately, empirical ML needs to make *causal* statements:

> Algorithm A outperformed algorithm B **because** the classes were highly imbalanced.

- I.e., if the classes were re-balanced (counterfactual intervention) the difference in performance would disappear.    <!-- .element: class="fragment" -->
  - NB. In empirical ML we can actually carry out interventions, which makes causal inference a whole lot easier!   <!-- .element: class="fragment" -->


## Outlook

Proper treatment of performance evaluation in machine learning (and AI more generally) requires a sophisticated model with the following components:
- *Measurement theory* for the observable performance indicators;
- *Latent-variable models* for the unobservable performance indicators of interest;
- *Causal models* to allow for counterfactual reasoning.


### Acknowledgements

Part of this work was funded through a [project with the Alan Turing Institute](https://www.turing.ac.uk/research/research-projects/measurement-theory-data-science-and-ai).

Many thanks to Jose Hernandez-Orallo, Kacper Sokol, Meelis Kull, Tom Diethe, Yu Chen, Ricardo Prudencio, Telmo Filho, Miquel Perello-Nieto, Hao Song and many others.  <!-- .element: class="fragment" -->
