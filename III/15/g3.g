reset
unset key
set ylabel"$\\lambda$/nm"
set xlabel "dílků s."
h(x)=k*x+q
fit h(x) "g3.dat" via k,q
plot "g3.dat", h(x)
set term epslatex
set output "g3.tex"
replot
set term wxt
replot
