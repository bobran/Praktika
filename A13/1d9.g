reset
set xlabel "$U_A$/V"
set ylabel "$I_A$/A"
unset key
plot [][0:] "1d9A.dat", "1d9Ab.dat"
set term epslatex
set output "1d9A.tex"
replot
set term wxt
replot
