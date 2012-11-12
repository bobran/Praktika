reset
set xlabel "n"
set ylabel "P"
G(x)=A*exp(-((x-m)**2)/(2*(s**2)))
m=1.2422
A=400
s=1
fit [0:20] G(x) "GM30.txt" via A,s,m
plot [0:7] "GM30.txt" t "data", G(x) t "Gaussova křivka"
set term epslatex
set output "gm30.tex"
replot
set term wxt
replot
