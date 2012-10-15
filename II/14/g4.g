set key
set xlabel "U_0/V"
set ylabel "U/V"
f(x)=a*x+b
g(x)=c*x+d
fit f(x) "g4.dat" u 1:2:3:4 via a,b
fit g(x) "g4.dat" u 1:2:5:6 via c,d
plot [30:120] "g4.dat" u 1:3:2:4 with xyerrorbars t "U_zh",\
"g4.dat" u 1:5:2:6 with xyerrorbars t "U_BO",\
f(x) notitle,\
g(x) notitle
set term epslatex
set output "g4.tex"
replot
set term wxt
replot
