reset
set xlabel "n"
set ylabel "P"
G(x)=A*exp(-((x-m)**2)/(2*(s**2)))
m=39.921
A=34
s=1
fit [0:100] G(x) "GM1000.txt" via A,s,m
plot [15:65] "GM1000.txt" t "data", G(x) t "Gaussova křivka"
set term epslatex
set output "gm1000.tex"
replot
set term wxt
replot
