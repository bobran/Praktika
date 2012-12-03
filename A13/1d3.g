reset
set xlabel "$U_A$/V"
set ylabel "$I_A$/A"
unset key
plot [][0:] "1d3A.dat", "1d3Ab.dat"
set term epslatex
set output "1d3A.tex"
replot
set term wxt
replot
