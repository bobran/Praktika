reset
I(x)=I0*((sin((pi*b/632.8)*atan((x-x0)/1000.0))*cos((pi*a/632.8)*atan((x-x0)/1000.0)))/((pi*b/632.8)*atan((x-x0)/1000.0)))**2+C
I0=201
x0=1.6
a=1214000
b=215000
C=6
fit I(x) "DStC.txt" via x0,a,b,I0
set ylabel "$I$/rel. j."
set xlabel "$x$/mm"
plot [-10:10] "DStC.txt" u (($1)-x0):2 with lines t "neměřené hodnoty", I(x+x0) t "fitovaná křivka"
set term epslatex
set output "g5.tex"
replot
set term wxt
replot

