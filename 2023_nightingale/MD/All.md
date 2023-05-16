## AI in the time of chatGPT

> In the time of ChatGPT, artificial intelligence had become a marvel of the modern world, a magical creation that seemed almost alive. It was as if the machines had a soul, capable of understanding and empathizing with human emotions. ChatGPT was a symbol of this new era, a mysterious being with a secret language that only the initiated could understand. But amidst the awe and wonder, there were also whispers of fear, for no one knew what the future held in this age of AI.


### What I will talk about

- [What ChatGPT is -- and isn't](#/2)
- [ChatGPT's most remarkable capabilities](#/3)
- [Has AI passed the Turing Test?](#/4)
- [We need to talk about overconfidence](#/5)
- [AI in the time of ChatGPT](#/6)


### Notes

<!--
ChatGPT makes mistakes with reasoning and arithmetic. But the surprising thing is it can do reasoning and arithmetic at all. This is somehow teased out of the language data. 
While reasoning, arithmetic and many other are emergent capabilities, this doesn't mean that they can be achieved perfectly by every larger LMs. 
Putting linguistic elements together in surprising and potentially novel ways is the essence of language, so "hallucination" shouldn't come as a surprise. "Generate something that looks like a URL/literature reference etc." This exemplifies the need for fact-checking (easy in the case of URLs). 
Achievements on "human" tasks have three ingredients: machine, human, task. E.g. Deep Blue, Kasparov, chess; AlphaGo, Lee Se Dong, Go. Conclusions should involve the triple: e.g., chess is more suited to algorithmic treatment than we thought. 
Games like chess and Go have emerged at a sweet spot: it can be played by children, but only few can play it really well. 
Nobody is surprised if the world champion mental calculation is beaten by a computer; or if the world champion road cycling is beaten by a motorbike. 
(something about models as a commodity)
(DNNs' modular design make them particularly suitable for finetuning and transfer learning)
(something about neuro-symbolic AI?)

Foster: these systems are designed to make stuff up
-->

----

## What ChatGPT is -- and isn't


### LLM + dialogue model

![chatGPT schematic](img/chatGPT.jpg)<!-- .element align="right" height="50%" width="50%" -->

[from https://blog.bytebytego.com/p/ep-44-how-does-chatgpt-work](https://blog.bytebytego.com/p/ep-44-how-does-chatgpt-work)


### Training the dialogue model with reinforcement learning

![chatGPT finetuing](img/finetuning.jpg)<!-- .element align="right" height="50%" width="50%" -->

[from https://openai.com/blog/chatgpt](https://openai.com/blog/chatgpt)


### An alien with good English

> Sometimes I think it's as if aliens had landed and people haven't realized because they speak very good English.

[Geoffrey Hinton in an interview with MIT Technology Review](https://www.technologyreview.com/2023/05/02/1072528/geoffrey-hinton-google-why-scared-ai/)


### The ultimate bullshit machine

> For the bullshitter [all] bets are off: he is neither on the side of the true nor on the side of the false. His eye is not on the facts at all, as the eyes of the honest man and of the liar are, except insofar as they may be pertinent
to his interest in getting away with what he says. He does not care whether the things he says describe reality correctly. He just picks them out, or makes them up, to suit his purpose.

[Harry Frankfurt, On Bullshit. Princeton University Press, 2005.](https://press.princeton.edu/books/hardcover/9780691122946/on-bullshit)


### Mansplaining-as-a-Service

![https://pullpatch.com/products/ladies-mansplaining-is-short-for-man-explaining-removable-patch](img/mansplaining.jpg)<!-- .element align="right" height="35%" width="35%" -->

"If someone perceives my responses as mansplaining, I apologize and encourage them to provide specific feedback on how I can improve and be more respectful in my interactions." (chatGPT)


### Intermezzo: Back to 1997

![Garry Kasparov against Deep Blue (1997)](img/DeepBlue.jpg)<!-- .element align="right" height="35%" width="35%" -->

A computer beats a grandmaster at chess. 
Does that say something about
- computers? <!-- .element: class="fragment" -->
- humans? <!-- .element: class="fragment" -->
- chess? <!-- .element: class="fragment" -->


### Real or fake?

![PF & GK](img/kasparov.jpg)<!-- .element align="right" height="50%" width="50%" -->


### Capturing the essence of human language

> I think we have to view this as a -- potentially surprising -- scientific discovery: that somehow in a neural net like ChatGPT's it's possible to capture the essence of what human brains manage to do in generating language.

[Stephen Wolfram: What Is ChatGPT Doing ... and Why Does It Work?](https://writings.stephenwolfram.com/2023/02/what-is-chatgpt-doing-and-why-does-it-work/)

----

## ChatGPT's most remarkable capabilities

----

## Has AI passed the Turing Test?

----

## We need to talk about overconfidence


### What is overconfidence? 


### Why does it matter? 


### What to do about overconfidence


### Computer says 'I Don't Know'

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
