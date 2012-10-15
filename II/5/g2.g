f(x)=A*x
fit f(x) "g2.dat" u 1:3:2 via A
set xlabel "$I/$mA"
set ylabel "$C/\\mu$F"
set y2label "$\\tau/$s"
set y2range [55:67]
set y2tics auto
plot "g2.dat" u 1:3:2 with xerrorbars t "$C$",\
f(x) t "$7.72\\cdot10^{-3}\\{I\\}$",\
"g2_b.dat" u 1:3:2:4 with xyerrorbars axes x1y2 t "$\\tau$" 
set key bottom
set term epslatex
set output "g2.tex"
replot
set term wxt
replot
