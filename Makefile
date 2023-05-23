clean:
	jekyll clean

build:
	jekyll build -b ''

view:
	cd _site
	python -m SimpleHTTPServer 8765

buildquarto:
	./build_quarto_website.sh

viewquarto:
	cd _site/_website
	python -m SimpleHTTPServer 8765
