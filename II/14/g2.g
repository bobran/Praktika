f(x)=A/x
fit f(x) "g2.dat" u 1:2:3:4 via A
plot "g2.dat" u 1:3:2:4 with xyerrorbars,\
f(x)
set xlabel "\tau/F\Omega"
set ylabel "f/Hz"
set term epslatex
set output "g2.tex"
replot
set term wxt
replot
