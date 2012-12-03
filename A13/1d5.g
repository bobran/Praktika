reset
set xlabel "$U_A$/V"
set ylabel "$I_A$/A"
unset key
plot [][0:] "1d5A.dat", "1d5Ab.dat"
set term epslatex
set output "1d5A.tex"
replot
set term wxt
replot
