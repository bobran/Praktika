reset
set xlabel "$U_A$/V"
set ylabel "$I_A$/A"
unset key
plot [][0:] "1A.dat", "1Ab.dat"
set term epslatex
set output "1A.tex"
replot
set term wxt
replot
