reset
set xlabel "Z"
set ylabel "$K_\\beta/K_\\alpha$"
set key left bottom
f(x)=a*x**5+b*x**4+c*x**3+d*x**2+e*x+f
fit f(x) "G1.dat" u 1:3 via a,b,c,d,e,f
plot "G1.dat" u 1:3 t "data", f(x) t "fitovaný polynom"
set term epslatex
set output "G1.tex"
replot
set term wxt
replot
