reset
set xlabel "$U_A$/V"
set ylabel "$I_A$/A"
unset key
plot "2d3Ac.dat", "2d3Ab.dat", "2d3A.dat"
set term epslatex
set output "2d3A.tex"
replot
set term wxt
replot
