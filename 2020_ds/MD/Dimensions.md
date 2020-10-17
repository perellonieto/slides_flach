## Units, dimensions and types

- Physical quantities have an associated dimension (Fourier, 1822). 
- In order to be compared and added, quantities need to be *commensurable* (have the same dimension). 
  - NB. This gives priority to additive scales!
- Incommensurable quantities may be multiplied and divided, giving new derived dimensions. 
- E.g. pressure has dimension $M L^{-1} T^{-2}$
  - SI units Pascal = Newton/m$^2$ = kg/(m*s$^2$).


### Dimensionless quantities can be problematic

- Angle is a ratio of lengths, hence dimensionless; but it has a unit (radians, degrees). This leads to angular velocity having dimension $T^{-1}$, which is odd. 
  - could choose $L_x$, $L_y$, $L_z$ as distinct dimensions. 
- Functions such as $\exp$, $\sin$ etc. can only take and result in dimensionless quantities. 
  - e.g., $\log V$ where $V$ has dimension $L^3$ should be thought of as $\log (V/v)$ where $v$ is an arbitrary unit of volume. 


### In ML, "dimensionless" quantities are everywhere

- relative frequencies, probabilities, evaluation metrics...
- Still, we treat derived quantities such as $\log p$ as having a unit (bits, log-likelihood). 
- We also have different concatenation operators, such as $p_1+p_2$ for the union of mutually exclusive events, $p_1 \cdot p_2$ for the joint probability of independent events. 


### Types to the rescue? 

[![xpecBits Haskell code](img/xpecBits.tiff)  <!-- .element height="80%" width="80%" -->](https://repl.it/repls/ThoughtfulWarlikeRuntimelibrary)
