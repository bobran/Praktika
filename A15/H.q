reset
unset key
set xlabel "n"
set ylabel "$\lambda$/nm"
f(x)=(1/R)*(x**2/((x/2)**2-1))
fit f(x) "H.dat" u 1:2 via R
plot f(x), "H.dat" u 1:2
set term epslatex
set output "GH.tex"
replot
set term wxt
replot
