.PHONY: reqs appendix postsass css watch-css release publish

CSS_SRC := src/_scss/thirteen.scss
CSS_DIST := src/css/thirteen.css
CSS_STYLE := compressed

reqs:
	npm install -g node-sass postcss-cli autoprefixer && brew install fswatch && gem install scss_lint

postsass:
	@echo "Running compiled CSS through PostCSS...";
	@postcss -c .postcss.json

css:
	@echo "Compiling CSS...";
	@node-sass --output-style $(CSS_STYLE) $(CSS_SRC) $(CSS_DIST) && $(MAKE) postsass

watch-css:
	@echo "Watching src/_scss/*.scss for changes...";
	@fswatch -0 src/_scss/*.scss | xargs -0 -n 1 $(MAKE) css

build:
	$(MAKE) css && jekyll build

publish:
	aws s3 sync public s3://runningawayat30.com
