unset key
set xlabel "U_0/V"
set ylabel "f/Hz"
f(x)=A*(x-B)/(x-C)
fit f(x) "g3.dat" u 1:2:3:4 via A,B,C
plot [30:120] "g3.dat" u 1:3:2:4 with xyerrorbars,\
f(x)
set term epslatex
set output "g3.tex"
replot
set term wxt
replot
