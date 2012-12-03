reset
set xlabel "$U_A$/V"
set ylabel "$I_A$/A"
unset key
plot "2d1Ab.dat", "2d1A.dat"
set term epslatex
set output "2d1A.tex"
replot
set term wxt
replot
