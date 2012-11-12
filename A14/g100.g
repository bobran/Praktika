reset
set xlabel "n"
set ylabel "P"
G(x)=A*exp(-((x-m)**2)/(2*(s**2)))
m=4.0264
A=144
s=1
fit [0:20] G(x) "GM100.txt" via A,s,m
plot [0:13] "GM100.txt" t "data", G(x) t "Gaussova křivka"
set term epslatex
set output "gm100.tex"
replot
set term wxt
replot
