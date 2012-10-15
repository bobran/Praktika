f(x)=A*x+B
fit f(x) "g1.dat" via A,B
g(x)=C*-x+D
fit g(x) "g1b.dat" via C,D
plot [-40:40][-15:15] "g1.dat" with yerrorbars notitle,\
"g1b.dat" with yerrorbars notitle,\
x<=23.05  ? f(x):0/0 notitle ,\
x>=-23.1 ?g(x):0/0 notitle
set yzeroaxis
set xzeroaxis
set xtics  ("UBO2"-32.7 ,-30,-20,-10,0,10,20,30,"UBO1"32.8 )
set xlabel "U/V"
set ylabel "I/mA"
set term epslatex
set output "g1.tex"
replot
set term wxt
replot
