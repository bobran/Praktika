f(x)=f0+f1*x+f2*x**2+f3*x**3+f4*x**4
g(x)=g0+g1*x+g2*x**2+g3*x**3+g4*x**4
fit f(x) "g1.dat" u 3:(1000*$1/$3) via f0,f1,f2,f3,f4
fit g(x) "g1b.dat" u 1:3 via g0,g1,g2,g3,g4
plot [3:30][130:900] f(x) notitle,\
"g1.dat" u 3:(1000*$1/$3):4:((1000*$1/$3)*(($2/$1)+($4/$3))) with xyerrorbars t "přímá metoda bez korekce",\
g(x) notitle,\
"g1b.dat" u 1:3:2:4 with xyerrorbars t "přímá metoda s korekcí"
set key left
set xlabel "$I/$mA"
set ylabel "$R/\\Omega$"
replot
set term epslatex
set output "g1.tex"
replot
set term wxt
