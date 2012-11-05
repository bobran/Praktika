reset
set xlabel "U$_z$/kV"
set ylabel "U$_s$/V"
unset key
plot [][-50:] "va2.dat" u 1:2
set term epslatex
set output "va2.tex"
replot
set term wxt
replot
