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
