mastertrial.html: mastertrial.Rmd ggtre/gapminder_trellis-example.html wrap2ts/gapminder_trellis_generic-example.html tsplotly/gapminder_trellis_plotly-example.html covidfinal/covid_trellis-example.html
	Rscript -e 'rmarkdown::render("$<")'

ggtre/gapminder_trellis-example.html: $(%@:.html=.Rmd)
	Rscript -e 'rmarkdown::render("$<")'

wrap2ts/gapminder_trellis_generic-example.html: $(%@:.html=.Rmd)
	Rscript -e 'rmarkdown::render("$<")'

tsplotly/gapminder_trellis_plotly-example.html: $(%@:.html=.Rmd)
	Rscript -e 'rmarkdown::render("$<")'

covidfinal/covid_trellis-example.html: $(%@:.html=.Rmd)
	Rscript -e 'rmarkdown::render("$<")'

clean:
	rm *.html */*-example.html

deploy: mastertrial.html
	if [ ! -e deploy ]; then mkdir deploy; fi
	for i in ggtre wrap2ts tsplotly covidfinal; do rsync -a $i/ deploy/$i/; done
	cp -p mastertrial.html deploy/
	rsync -a appfiles/ deploy/appfiles/

.PHONY: clean
