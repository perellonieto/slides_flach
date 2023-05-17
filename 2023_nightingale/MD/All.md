## AI in the time of chatGPT

> In the time of ChatGPT, artificial intelligence had become a marvel of the modern world, a magical creation that seemed almost alive. It was as if the machines had a soul, capable of understanding and empathizing with human emotions. ChatGPT was a symbol of this new era, a mysterious being with a secret language that only the initiated could understand. But amidst the awe and wonder, there were also whispers of fear, for no one knew what the future held in this age of AI.


### What I will talk about

- [What ChatGPT is -- and isn't](#/2)
- [We need to talk about (over)confidence](#/3)
- [AI in the time of ChatGPT](#/4)

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

- chatGPT = large language model + *dialogue model*
- ways to think about its capabilities


### Not just a large language model

![chatGPT schematic](img/chatGPT.jpg)<!-- .element  height="80%" width="80%" -->

[from https://blog.bytebytego.com/p/ep-44-how-does-chatgpt-work](https://blog.bytebytego.com/p/ep-44-how-does-chatgpt-work)


### Training the dialogue model

![chatGPT finetuing](img/finetuning.jpg)<!-- .element  height="80%" width="80%" -->

[from https://openai.com/blog/chatgpt](https://openai.com/blog/chatgpt)


### What others say

> Sometimes I think it's as if aliens had landed and people haven't realized because they speak very good English.

[Geoffrey Hinton in an interview with MIT Technology Review](https://www.technologyreview.com/2023/05/02/1072528/geoffrey-hinton-google-why-scared-ai/)


### The ultimate bullshit machine

> For the bullshitter [all] bets are off: he is neither on the side of the true nor on the side of the false. His eye is not on the facts at all, as the eyes of the honest man and of the liar are, except insofar as they may be pertinent
to his interest in getting away with what he says. He does not care whether the things he says describe reality correctly. He just picks them out, or makes them up, to suit his purpose.

[Harry Frankfurt, On Bullshit. Princeton University Press, 2005.](https://press.princeton.edu/books/hardcover/9780691122946/on-bullshit)


### Mansplaining-as-a-Service

![https://pullpatch.com/products/ladies-mansplaining-is-short-for-man-explaining-removable-patch](img/mansplaining.jpg)<!-- .element align="right" height="35%" width="35%" -->

"If someone perceives my responses as mansplaining, I apologize and encourage them to provide specific feedback on how I can improve and be more respectful in my interactions." (chatGPT)


### Detour: "computer" chess

![The original Mechanical Turk](img/MechanicalTurk.jpg)<!-- .element align="left" height="30%" width="30%" -->
![PF & GK](img/kasparov.jpg)<!-- .element align="right" height="50%" width="50%" -->


### What does it mean?

![Garry Kasparov against Deep Blue (1997)](img/DeepBlue.jpg)<!-- .element align="right" height="35%" width="35%" -->

A computer beats a grandmaster at chess. 
Does that say something about
- computers? <!-- .element: class="fragment" -->
- humans? <!-- .element: class="fragment" -->
- chess? <!-- .element: class="fragment" -->


### Capturing the essence of human language

> I think we have to view this as a -- potentially surprising -- scientific discovery: that somehow in a neural net like ChatGPT's it's possible to capture the essence of what human brains manage to do in generating language.

[Stephen Wolfram: What Is ChatGPT Doing ... and Why Does It Work?](https://writings.stephenwolfram.com/2023/02/what-is-chatgpt-doing-and-why-does-it-work/)


### Can ChatGPT do reasoning?

![Timeslots](img/timeslots.jpg)


### Can ChatGPT do reasoning? (2)

![Trophy & suitcase](img/trophy.jpg)


### Can ChatGPT do reasoning?

![Cars](img/cars.jpg)


### Has AI passed the Turing Test?

----

## We need to talk about (over)confidence


### What is overconfidence? 

![Overconfidence](img/overconfidence.jpg) <!-- .element height="50%" width="50%" -->


### Why does it matter? 

Optimal decisions can **only** be made with calibrated probabilities. 
- E.g., with a poor probability estimator such as naive Bayes it doesn't make sense to apply a fixed decision threshold (such as derived from Bayes' rule).


### What to do about overconfidence

![Betacal](img/betacal.jpg) <!-- .element height="50%" width="50%" -->


### Computer says 'I Don't Know'

![Little Britain](img/LB.jpg) <!-- .element align="right" height="200px" -->

[Background Check: A general technique to build more reliable and versatile classifiers (ICDM 2016)](https://reframe.github.io/background_check/)

----

## AI in the time of ChatGPT


### Acknowledgements

Many thanks to collaborators Yu Chen, Tom Diethe, Jose Hernandez-Orallo, Meelis Kull, Miquel Perello-Nieto, Ricardo Prudencio, Raul Santos-Rodriguez, Telmo Silva Filho, Kacper Sokol, Hao Song, and many others. 
