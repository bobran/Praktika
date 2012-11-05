reset
set xlabel "$U$/V"
set ylabel "$I$/nA"
set logscale x
set key left
plot "va.dat" u 1:2:($2*0.1) with yerrorbars t "6 cm", "" u 1:3:($3*0.1) with yerrorbars t "1 cm"
set term epslatex
set output "va.tex"
replot
set term wxt
replot
