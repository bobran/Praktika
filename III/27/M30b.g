reset
set ylabel "$(U/\\mbox{V})^2$"
set xlabel "$\\Delta/\\mbox{rad}$"
set key left top
f(x)=k*x+q
fit [1.4:] f(x) "M30b.dat" u (2*$2):(($1)**2) via k,q 
plot [0.1:][160000:] "M30b.dat" u (2*$2):(($1)**2) t "naměřené hodnoty", f(x) t "fitovaná křivka"
set term epslatex
set output "G30b.tex"
replot
set term wxt
replot
