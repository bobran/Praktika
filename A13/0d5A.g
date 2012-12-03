reset
set xlabel "$U_A$/V"
set ylabel "$I_A$/A"
unset key
plot "0d5A.dat", "0d5bA.dat"
set term epslatex
set output "0d5A.tex"
replot
set term wxt
replot
