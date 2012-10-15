reset
set ylabel "$N$"
set xlabel "$t/\\st\\mbox{C}$" 
f1(x)=a1+b1*1/x+c1*1/x**2+d1*1/x**3+e1*1/x**4
f2(x)=a2+b2*1/x+c2*1/x**2+d2*1/x**3+e2*1/x**4
f3(x)=a3+b3*1/x+c3*1/x**2+d3*1/x**3+e3*1/x**4
fit f1(x) "T.dat" u 1:2 via a1,b1,c1,d1,e1
fit f2(x) "T.dat" u 1:3 via a2,b2,c2,d2,e2
fit f3(x) "T.dat" u 1:4 via a3,b3,c3,d3,e3
plot "T.dat" u 1:2 t "404.7 nm", "" u 1:3 t "546.1 nm", "" u 1:4 t "579.1 nm", f1(x) notitle, f2(x) notitle, f3(x) notitle
set term epslatex
set output "GT.tex"
replot
set term wxt
replot
