reset
set xlabel "n"
set ylabel "P"
G(x)=A*exp(-((x-m)**2)/(2*(s**2)))
m=32.269
A=44
s=1
fit [0:60] G(x) "GM800.txt" via A,s,m
plot [0:60] "GM800.txt" t "data", G(x) t "Gaussova křivka"
set term epslatex
set output "gm800.tex"
replot
set term wxt
replot
