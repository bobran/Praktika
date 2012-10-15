reset
f(x)=f0+f1*x+f2*x**2+f3*x**3+f4*x**4+f5*x**5+f6*x**6+f7*x**7+f8*x**8
g(x)=g0+g1*x+g2*x**2+g3*x**3+g4*x**4
fit f(x) "g2.dat" u 1:3 via f0,f1,f2,f3,f4,f5,f6,f7,f8
fit g(x) "g1b.dat" u 1:3 via g0,g1,g2,g3,g4
plot [0:][100:] "g2.dat" u 1:3:2:4 with xyerrorbars t "substituční metoda",\
x<25 ? f(x): 0/0 notitle,\
x>4 ? g(x): 0/0 notitle,\
"g1b.dat" u 1:3:2:4 with xyerrorbars t "přímá metoda s korekcí"
set key left
set xlabel "$I/$mA"
set ylabel "$R/\\Omega$"
replot
set term epslatex
set output "g3.tex"
replot
set term wxt
