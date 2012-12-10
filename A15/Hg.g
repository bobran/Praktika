reset
unset key
set xlabel "n"
set ylabel "$\\lambda$/nm"
f(x)=(C)*(x**2/(x**2-4))
fit f(x) "H.dat" u 1:2 via C
plot [2.9:5.1] f(x), "H.dat" u 1:2
set term epslatex
set output "GH.tex"
replot
set term wxt
replot
