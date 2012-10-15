k(x)=((4204*0.5)/(2.0*0.4*(0.07-0.04)))*((0.2+((x+p)/100.0))*log((0.07+sqrt(0.07**2+(0.2+((x+p)/100.0))**2))/(0.04+sqrt(0.04**2+(0.2+((x+p)/100.0))**2)))+(0.2-((x+p)/100.0))*log((0.07+sqrt(0.07**2+(0.2-((x+p)/100.0))**2))/(0.04+sqrt(0.04**2+(0.2-((x+p)/100.0))**2))))
fit k(x) "g5.dat" via p
plot[-2:42] k(x) notitle, "g5.dat" with yerrorbars notitle
set xlabel "x/cm"
set ylabel "H/Am-1
set term epslatex
set output "g5.tex"
replot
set term wxt
replot
