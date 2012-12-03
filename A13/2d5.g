reset
set xlabel "$U_A$/V"
set ylabel "$I_A$/A"
unset key
plot "2d5A.dat"
set term epslatex
set output "2d5A.tex"
replot
set term wxt
replot
