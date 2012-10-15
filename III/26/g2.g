reset
set xlabel "U$/\\mbox{V}$"
set ylabel "$I/\\RJ$"
plot "g2.dat" u 1:($2/287) notitle
set term epslatex
set output "g2.tex"
replot
set term wxt
replot
