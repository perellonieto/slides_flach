# Home

This website is an example of how the [source
code](https://github.com/flach/slides) of the website
[flach.github.io/slides/](https://flach.github.io/slides/) can be adapted to
a Quarto website. The new Quarto source code can be found at the forked repository
[perellonieto/slides_flach](https://github.com/perellonieto/slides_flach).

Currently, the slides in section 2023 have been rendered directly as Quarto
webpages. While slides in section 2022 have been rendered as RevealJS by
Quarto.

Notice that [2022_leuven](2022_leuven) ([see original](https://flach.github.io/slides/2022_leuven/#/))slides are not divided on the correct slide
content as the division between slides is specified in a different way.

On the other side, [2022_monash](2022_monash) ([see original](https://flach.github.io/slides/2022_monash/#/))
the title levels have been increased by one (e.g. `## Title` for `# Title`),
which divided all sections with a title of level 1 or 2 (`#` or `##`) into a
new slide.
This is still not the same behaviour than the original slides
[flach.github.io](https://flach.github.io/slides/2022_monash/) that used
`\n----\n\n` to separate vertical sections of the presentation (as specified in
the `html` index as `data-separator="^\n---\n\n"`). I have also tried to add
the css format from the ``reveal.css`` file in the last one. However, the
format does not look the same as the original. This needs to be checked.

Another details is that when Quarto generates the RevealJS slides, the
resulting slides are part of an `.html` file (see [2022/monash
example](https://github.com/perellonieto/slides_flach/tree/gh-pages/2022_monash)).
In contrast, the original Jekyll version contains an `.html` file with the
basic information and the `markdown` file as a `data-markdown="MD/All.md"` (see
[source code](https://flach.github.io/slides/2022_monash/#/))


## TODOs

- [ ] Add style of the original slides (probably with the css files)
- [ ] Understand what is the required webpage layout
