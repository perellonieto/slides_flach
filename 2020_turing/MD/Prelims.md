## Means and scales

**Segment 1**: distance $d_1$, time $t_1$, velocity $v_1=d_1/t_1$
**Segment 2**: distance $d_2$, time $t_2$, velocity $v_2=d_2/t_2$
**Overall**: distance $d=d_1+d_2$, time $t=t_1+t_2$, velocity $v=(d_1+d_2)/(t_1+t_2)$

- $t_1=t_2 \Rightarrow v = (v_1+v_2)/2 = A(v_1,v_2)$ <!-- .element: class="fragment" -->
  - or in general: $v = {\color{red}{(t_1/t)}}\cdot v_1 + {\color{red}{(t_2/t)}}\cdot v_2$ <!-- .element: class="fragment" -->
- $d_1=d_2 \Rightarrow v = 2/(1/v_1+1/v_2) = H(v_1,v_2)$ <!-- .element: class="fragment" -->
  - or in general: $1/v = {\color{red}{(d_1/d)}}\cdot 1/v_1 + {\color{red}{(d_2/d)}}\cdot 1/v_2$ <!-- .element: class="fragment" -->


### Means and scales (cont.)

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


### Quiz!

- Scores in an ensemble are often arithmetically averaged to obtain an overall score. 
- But what if the base classifiers are probability estimators? Do you  <!-- .element: class="fragment" -->
  1. Continue to use arithmetic mean?  <!-- .element: class="fragment" -->
  2. Convert to bits first (aka log-likelihoods)?  <!-- .element: class="fragment" -->
  3. Use geometric mean?  <!-- .element: class="fragment" -->
