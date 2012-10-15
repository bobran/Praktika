reset
set key left
set xlabel "$\\varphi/\\st$"
set ylabel "$I/\\RJ$"
f(x)=a*exp(-(x-x0)**2/(2*s**2))
fit f(x) "g1.dat" via x0,a,s
plot "g1.dat" notitle, f(x) notitle
set term epslatex
set output "g1.tex"
replot
set term wxt
replot
