f(x)=A
fit f(x) "g4.dat" via A
plot [2:8][900:1200]  (8*100*1.5)/(5.0*sqrt(5)*(0.104)) t "teoretická", "g4.dat" with yerrorbars notitle, f(x) t "fitovaná"
set xlabel "x/cm"
set ylabel "H/Am-1
set term epslatex
set output "g4.tex"
replot
set term wxt
replot
