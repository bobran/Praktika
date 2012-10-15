plot[-8:8]0.8112*(((0.010816+((0.06+(x/100.0))**2))**(-1.5))+((0.010816+((0.06-(x/100.0))**2))**(-1.5))) notitle,0.8112*(((0.010816+((0.08+(x/100.0))**2))**(-1.5))+((0.010816+((0.08-(x/100.0))**2))**(-1.5))) notitle ,0.8112*(((0.010816+((0.1+(x/100.0))**2))**(-1.5))+((0.010816+((0.1-(x/100.0))**2))**(-1.5))) notitle , "g1_1.dat" with yerrorbars t "12 cm" , "g1_2.dat" with yerrorbars t "16 cm" , "g1_3.dat" with yerrorbars t "20 cm"
set xlabel "x/cm"
set ylabel "H/Am-1
set term epslatex
set output "g1.tex"
replot
set term wxt
replot
