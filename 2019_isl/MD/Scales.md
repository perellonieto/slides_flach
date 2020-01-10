## Scales, Units and Dimensions

- Stevens' levels of measurement (1946)
- dimensional analysis in physics
- do statistical quantities have dimensions?


### Stevens' levels of measurement (1946)

[![Stevens (1946)](img/Stevens1946.gif)  <!-- .element height="20%" width="20%" -->](https://www.jstor.org/stable/1671815)
![Stevens' levels](img/StevensTable.png)  <!-- .element height="65%" width="65%" -->


### Levels of measurement

- Nominal: no order, no scale
- Ordinal: order, no scale
- Interval: differences are meaningful, but no zero
- Ratio: ratios are meaningful

There should be more? E.g. scales bounded from both sides. <!-- .element: class="fragment" -->


### Dimensional analysis in physics

- Physical quantities have an associated dimension (Fourier, 1822). 
- In order to be compared and added/subtracted, quantities need to be *commensurable* (have the same dimension). 
- Incommensurable quantities may be multiplied and divided, giving new derived dimensions. 
- E.g. pressure has dimension $M L^{-1} T^{-2}$
  - SI units Pascal = Newton/m$^2$ = kg/(m*s$^2$).


### Buckingham's $\pi$ theorem (1914)

[![Buckingham (1914)](img/Buckingham1914.png)  <!-- .element height="80%" width="80%" -->](https://babel.hathitrust.org/cgi/pt?id=uc1.31210014450082&view=1up&seq=905)


### Dimensionless quantities can be problematic

- Angle is a ratio of lengths, hence dimensionless; but it has a unit (radians, degrees). This leads to angular velocity having dimension $T^{-1}$, which is odd. 
  - could choose lengths in $x$, $y$, $z$ directions as distinct dimensions. 
- Functions such as $\exp$, $\sin$ etc. can only take and result in dimensionless quantities. 
  - e.g., $\log V$ where $V$ has dimension $L^3$ should be thought of as $\log (V/v)$ where $v$ is an arbitrary unit of volume. 


### In ML, "dimensionless" quantities are everywhere

- relative frequencies, probabilities, evaluation metrics...
- Still, we treat derived quantities such as $\log p$ as having a unit (bits, log-likelihood). 
- We also have different concatenation operators, such as $p_1+p_2$ for the union of mutually exclusive events, $p_1 \cdot p_2$ for the joint probability of independent events. 


### Types to the rescue? 

[![xpecBits Haskell code](img/xpecBits.png)  <!-- .element height="80%" width="80%" -->](https://repl.it/repls/ThoughtfulWarlikeRuntimelibrary)
