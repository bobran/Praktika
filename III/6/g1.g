reset
set ylabel "$I$/rel. j."
set xlabel "$x$/mm"
set xrange [-30:30]
plot "mrizka.txt" u ($1)-0.33:2 with lines notitle
set term epslatex
set output "g1.tex"
replot
set term wxt
replot

