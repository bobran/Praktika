reset
set xlabel "$U_A$/V"
set ylabel "$I_A$/A"
unset key
plot [][0:] "1d1A.dat", "1d1Ab.dat"
set term epslatex
set output "1d1A.tex"
replot
set term wxt
replot
