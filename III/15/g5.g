reset
f(x)=(53.04*x)-529.36
set xlabel "$\\lambda$/nm"
set ylabel "relativní intenzita"
set style data lines
set term wxt
plot "GaAsM1185.txt" u (f($1)):2 t "první měřnení", "GaAsM1185b.txt" u (f($1)):2 t "druhé měření"
set term epslatex
set output "g5.tex"
replot
set term wxt
replot

