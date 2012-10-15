plot [6:21][500:1400] 2*0.8112*(((0.010816+((x/200.0)**2))**(-1.5))) notitle, "g3.dat" with yerrorbars notitle
set xlabel "d/cm"
set ylabel "H/Am-1
set term epslatex
set output "g3.tex"
replot
set term wxt
replot
