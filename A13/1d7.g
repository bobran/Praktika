reset
set xlabel "$U_A$/V"
set ylabel "$I_A$/A"
unset key
plot [][0:] "1d7A.dat", "1d7Ab.dat"
set term epslatex
set output "1d7A.tex"
replot
set term wxt
replot
