# Set of slides by Peter Flach

This repository contains a set of slides mostly written in Markdown and using
Jekyll and Reveal.js to render into html.

## Local rendering

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
