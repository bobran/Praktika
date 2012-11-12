reset
set xlabel "$U$/V"
set ylabel "N"
f(x)=a*x+b
fit [360:] f(x) "t1.dat" u 1:2:(sqrt($2)) via a,b
plot [280:][4000:]  f(x) t "2.66$U$+3900", "t1.dat" u 1:2:(sqrt($2)) with yerrorbars t "naměřené hodnoty"
set term epslatex
set output "g1.tex"
replot
set term wxt
replot

