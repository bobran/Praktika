reset
set key bottom
f(x)=k*x+q
fit f(x) "kal.dat" via k,q
plot "kal.dat" notitle, f(x) t "kalibrační křivka"
set term epslatex
set output "kal.tex"
replot
set term wxt
replot
