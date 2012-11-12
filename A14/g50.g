reset
set xlabel "n"
set ylabel "P"
G(x)=A*exp(-((x-m)**2)/(2*(s**2)))
m=2.0883
A=300
s=1
fit [0:20] G(x) "GM50.txt" via A,s,m
plot [0:8] "GM50.txt" t "data", G(x) t "Gaussova křivka"
set term epslatex
set output "gm50.tex"
replot
set term wxt
replot
