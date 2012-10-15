f(x)=A*exp(C*x)+B
A=-3
C=-10
fit f(x) "g1.dat" u 1:2:3 via A,B,C
plot [-0.5:10.5] "g1.dat" with yerrorbars t "naměřené hodnoty",\
x>0? f(x): 0/0 t "$-3e^{-\\{C\\}}+8.2$"
set key right bottom
set ylabel "$U$/V"
set xlabel "$C/\\mu$F"
set term epslatex
set output "g1.tex"
replot
set term wxt
replot
