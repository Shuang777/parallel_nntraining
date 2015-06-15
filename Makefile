
type = paper
output = inter15

all: $(type).pdf	
	cp $(type).pdf ~/Desktop/$(output).pdf

$(type).pdf: $(type).tex $(type).bib scaling.png
	pdflatex $(type)
	bibtex $(type)
	pdflatex $(type)
	pdflatex $(type)

scaling.png: scaling.dat
	gnuplot scaling.gnu

percent.png: percent.dat
	gnuplot percent.gnu

scaling.dat: time.dat
	awk '/^#/{next;} /^[^0-9]/{print $1, $2, $4, $2, $4} /^[0-9]/ {if ($1 == 1) {print $1, 1, 1, 1, 1; base=$2; } else {print $1, base/($2*$1), base/($4*$1), base/$2, base/$4}}' time.dat > scaling.dat

percent.dat: time.dat
	awk '/^#/{next;} /^[^0-9]/{print $1, $2, $4} /^[0-9]/ {print $1, $3/$2, $5/$4}' time.dat > percent.dat

clean:
	-rm -f $(type).aux $(type).log $(type).pdf  ${type}.bbl ${type}.blg
