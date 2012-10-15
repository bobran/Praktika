reset
I(x)=I0*((sin((pi*b/632.8)*atan((x-x0)/1000.0)))/((pi*b/632.8)*atan((x-x0)/1000.0)))**2+C
I0=230
x0=1.5
b=110000
fit [-3.7:6.5] I(x) "StA.txt" via I0,b,x0,C
set ylabel "$I$/rel. j."
set xlabel "$x$/mm"
plot [-10:10] "StA.txt" u (($1)-x0):2 with lines t "neměřené hodnoty", I(x+x0) t "fitovaná křivka"
set term epslatex
set output "g2.tex"
replot
set term wxt
replot

