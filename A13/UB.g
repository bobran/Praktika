reset
set xlabel "$I_m$/A"
set ylabel "$I_A\cdot 10^{-4}$/A"
set key left bottom
plot "UB.dat" u 1:2 t "0 V", "" u 1:3 t "20 V", "" u 1:4 t "40 V" , "" u 1:5 t "60 V", "" u 1:6 t "80 V", "" u 1:7 t "100 V", "" u 1:8 t "120 V", "" u 1:9 t "140 V", "" u 1:10 t "160 V", "" u 1:11 t "180 V", "" u 1:12 t "200 V"
set term epslatex
set output "UB.tex"
replot
set term wxt
replot
