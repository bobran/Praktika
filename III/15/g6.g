reset
f(x)=(53.04*x)-529.36
set xlabel "$\\lambda$/nm"
set ylabel "relativní intenzita"
set style data lines
unset key
set term wxt
plot [810:824] "GaAsM1185b.txt" u (f($1)):2
set term epslatex
set output "g6.tex"
replot
set term wxt
replot
