reset
set xlabel "$U_A$/V"
set ylabel "$I_A$/A"
unset key
plot "0A.dat", "0Ab.dat"
set term epslatex
set output "0A.tex"
replot
set term wxt
replot
