reset
set ylabel "$I$/mA"
set y2label "$\\Phi_e$/mW"
set y2tics
set xlabel "$U$/V"
set xrange [:1.95]
set y2range [0:0.55]
set yrange [0:]
set key left top
f(x)=k*x+q
fit [1.7:] f(x) "g1.dat" via k,q
plot  [:1.95] "g1.dat" t "VA charakteristika", "g1.dat" u 1:4 ax x1y2 t "světelná charakteristika", f(x) notitle
set term epslatex
set output "g1.tex"
replot
set term wxt
replot
