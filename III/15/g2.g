unset y2label
unset key
set ylabel"$I$"
set xlabel "dílků s."
plot "Hg.txt" with lines
set term epslatex
set output "g2.tex"
replot
set term wxt
replot
