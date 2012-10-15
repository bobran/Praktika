reset
set ylabel "$N$"
set xlabel "$\\lambda/\\mbox{nm}$"
f(x)=a+b*1/x+c*1/x**2+d*1/x**3+e*1/x**4
fit f(x) "GoF3.dat" via a,b,c,d,e
plot "GoF3.dat" t "tabelové hodnoty", f(x) t "fitovaná záavislost"
set term epslatex
set output "GGoF3.tex"
replot
set term wxt
replot
