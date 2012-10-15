reset
set xlabel "$U/\\mbox{V}$"
set ylabel "$I/\\RJ$"
set key left top
I(x)=I0*(sin((pi*K*l*((x-x0)**2))/(d**2)))**2+0.35
I0=4.3
l=0.0014
d=0.0015
K=0.0000000055
x0=390
fit [400:] I(x) "M60.dat" via I0,K,x0
plot [0:1005][0:] "M60.dat" u ($1):($2-0.33) t "naměřené hodnoty",x>400?I(x)-0.35:0 t "fitovaná křivka"
set term epslatex
set output "G60.tex"
replot
set term wxt
replot
