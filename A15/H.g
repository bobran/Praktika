reset
unset key
set xlabel "x"
set ylabel "$\lambda$/nm"
f(x)=(((((a*x+b)*x+c)*x+d)*x+e)*x +f)
fit f(x) "Hg.dat" u 2:1 via a,b,c,d,e,f
plot f(x), "Hg.dat" u 2:1
set term epslatex
set output "GHg.tex"
replot
set term wxt
replot
