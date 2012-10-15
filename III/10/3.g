reset
set ylabel "$N$"
set xlabel "$\\lambda/\\mbox{nm}$"
f(x)=a+b*1/x+c*1/x**2+d*1/x**3+e*1/x**4
fit f(x) "3.dat" via a,b,c,d,e
plot "3.dat" t "naměřené hodnoty", f(x) t "fitovaná záavislost"
set term epslatex
set output "G3.tex"
replot
set term wxt
replot
