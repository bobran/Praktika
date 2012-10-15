set ylabel "$I/$mA"
set xlabel "$U/$V"
set xrange [-2:2]
set yrange [-0.5:]
set zeroaxis
plot x<=-0.6? 0: x<0? (1/0.6**2)*(x+0.6)**2 : x<0.8? 1+x/0.4 : 3*x+0.6 notitle,\
"g3.dat" notitle
set term epslatex
set output "g3.tex"
replot
set term wxt
replot

