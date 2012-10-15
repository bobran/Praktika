reset
f(x)=(53.04*x)-529.36
set style data lines
set xlabel "$\\lambda$/nm"
set ylabel "rel. intenzita"
plot [][7:]  "GaAs800.txt" u (f($1)):2 t "80.0 mA",\
"GaAs901.txt" u (f($1)):2 t "90.1 mA","GaAs1002.txt" u (f($1)):2 t "100.2 mA", "GaAs1101.txt" u (f($1)):2 t "110.1 mA",\
"GaAs1143.txt" u (f($1)):2 t "114.3 mA"
set term epslatex
set output "g4.tex"
replot
set term wxt
replot
