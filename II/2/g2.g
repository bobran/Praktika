reset
f(x)=f0+f1*x+f2*x**2+f3*x**3+f4*x**4+f5*x**5+f6*x**6+f7*x**7+f8*x**8
R(x)=R0
fit [0:2] R(x) "g2.dat" u 1:3 via R0
fit f(x) "g2.dat" u 1:3 via f0,f1,f2,f3,f4,f5,f6,f7,f8
plot [0:26][100:800] "g2.dat" u 1:3:2:4 with xyerrorbars t "substituční metoda",\
f(x) notitle,\
R(x) t "$R_0$"
set key left
set xlabel "$I/$mA"
set ylabel "$R/\\Omega$"
replot
set term epslatex
set output "g2.tex"
replot
set term wxt
