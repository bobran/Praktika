reset
set xlabel "$U_A$/V"
set ylabel "$I_A$/A"
unset key
plot "0d7A.dat", "0d7bA.dat"
set term epslatex
set output "0d7A.tex"
replot
set term wxt
replot
