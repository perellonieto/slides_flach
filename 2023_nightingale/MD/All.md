## AI in the time of chatGPT

> In the time of ChatGPT, artificial intelligence had become a marvel of the modern world, a magical creation that seemed almost alive. It was as if the machines had a soul, capable of understanding and empathizing with human emotions. ChatGPT was a symbol of this new era, a mysterious being with a secret language that only the initiated could understand. But amidst the awe and wonder, there were also whispers of fear, for no one knew what the future held in this age of AI.


### What I will talk about

- [What ChatGPT is -- and isn't](#/2)
- [ChatGPT's most remarkable capabilities](#/3)
- [Has AI passed the Turing Test?](#/4)
- [We need to talk about overconfidence](#/5)
- [AI in the time of ChatGPT](#/6)

----

## What ChatGPT is -- and isn't

- schematic with two levels: LLM + dialogue model
- development of instructGPT


### LLM = ultimate predictive text

> I think we have to view this as a—potentially surprising—scientific discovery: that somehow in a neural net like ChatGPT’s it’s possible to capture the essence of what human brains manage to do in generating language.

[Stephen Wolfram: What Is ChatGPT Doing … and Why Does It Work?](https://writings.stephenwolfram.com/2023/02/what-is-chatgpt-doing-and-why-does-it-work/)


### chatGPT = Mansplaining-as-a-Service

![https://pullpatch.com/products/ladies-mansplaining-is-short-for-man-explaining-removable-patch](img/mansplaining.jpg)<!-- .element height="50%" width="50%" -->


### chatGPT = Bullshit machine

> For the bullshitter [all] bets are off: he is neither on the side of the true nor on the side of the false. His eye is not on the facts at all, as the eyes of the honest man and of the liar are, except insofar as they may be pertinent
to his interest in getting away with what he says. He does not care whether the things he says describe reality correctly. He just picks them out, or makes them up, to suit his purpose.

Harry Frankfurt, On Bullshit. Princeton University Press, 2005. 

----

## ChatGPT's most remarkable capabilities

----

## Has AI passed the Turing Test?

----

## We need to talk about overconfidence

----

## AI in the time of ChatGPT

----

### Slide 1.1

If I split a data set in two or more parts, is a classifier's *accuracy* on the entire data set equal to the average* of the accuracies on the separate parts? 

Yes -- provided the parts are of equal size (e.g., cross-validation).  <!-- .element: class="fragment" -->

What about per-class recall ( = true positive rate)?  <!-- .element: class="fragment" -->

Yes -- provided the parts have the same class distribution (e.g., stratified CV). <!-- .element: class="fragment" -->

*To be precise: the arithmetic mean. 


### Slide 1.2

Is a classifier's *precision* on the entire data set equal to the average of the precisions on the parts? 

**IT IS NOT!**  <!-- .element: class="fragment" -->

Unless the classifier's predictions are equally distributed over the classes on each part, which is neither likely nor under the experimenter's control.  <!-- .element: class="fragment" -->

The same applies a fortiori to F-score, which aggregates recall and precision.  <!-- .element: class="fragment" -->

----

## Section 2

Perhaps surprisingly, there doesn't seem to be a definitive framework to link all these concepts together.

We'll look at it from a few perspectives:

- [Levels of measurement](#/2/1)
- [The physics perspective](#/2/6)
- [The computer science perspective](#/2/9)


## Slide 2.1

asdfasdf

----

## Concluding remarks

Proper treatment of performance evaluation in data science and AI requires a sophisticated **measurement framework** with the following components:
- *Coherent types and meta-data* for the observable performance indicators;
- *Latent-variable models* for the unobservable performance indicators of interest;
- *Causal models* to allow for counterfactual reasoning.


### Acknowledgements

Part of this work was funded through a project with the Alan Turing Institute; papers, code and videos can be accessed [here](https://www.turing.ac.uk/research/research-projects/measurement-theory-data-science-and-ai#recent-updates).

Many thanks to Hao Song, the Research Associate on the project; and collaborators Jose Hernandez-Orallo, Kacper Sokol, Meelis Kull, Tom Diethe, Yu Chen, Ricardo Prudencio, Telmo Filho, Miquel Perello-Nieto, Raul Santos-Rodriguez and many others.  <!-- .element: class="fragment" -->
