set ylabel "$I/$mA"
set xlabel "$U/$V"
set xrange [-8:3]
set yrange [-40:200]
set zeroaxis
plot x<=-6.4? 50*(x+6.3) : x<-6.2? (5/(0.2**3))*(x+6.2)**3 : x<0.4? 0 : x<0.64? (20/(0.24**6))*(x-0.4)**6  :1000*(x-0.62) notitle,\
"g4.dat" notitle
set term epslatex
set output "g4.tex"
replot
set term wxt
replot

