# Set of slides by Peter Flach

This repository contains a set of slides mostly written in Markdown and using
Jekyll and Reveal.js to render into html.

## Local rendering of slides

Use Jekyll to render the slides locally into the default `_sites` folder

```bash
jekyll build -b ""
```

Then, run a HTTP server (e.g. Python SimpleHTTPServer) into the newly created
`_sites` folder

```bash
cd _sites
python -m SimpleHTTPServer
```

and open the following link in your webbrowser [http://localhost:8000/](http://localhost:8000/)


## Local rendering of Quarto website

The configuration file for Quarto can be found at `quarto_config/_quarto.yml`.
Currently, Jekyll is used to build the base `_site` which keeps the `markdown`
files intact as those are used in the `index.html` files with `Reveal.js`.

The script [./build_quarto_website.sh](./build_quarto_website.sh) builds the
Jekyll + Reveal.js website, then moves some files to different folders and
finally builds a quarto website in `_site/_website`. In order to check locally
the website enter the folder and start an HTTP server

```bash
cd _sites/_website/
python -m SimpleHTTPServer
```

Currently only the markdowns of the form `/MD/All.md` are rendered correctly as
`index.html` files. The rest of the markdown files (e.g. `/MD/Ugly.md`) are
left in their corresponding folder. It is still necessary to incorporate the
original `index.html` files, which contain the instructions and order of their
corresponding markdown files.
