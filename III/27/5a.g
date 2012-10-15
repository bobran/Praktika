reset
set key left top
set ylabel "$(U/\\mbox{V})^2$"
set xlabel "$\\Delta/\\mbox{rad}$"
f(x)=k*x+q
fit [0.5:] f(x) "5a.dat" u ((4*pi/360)*($2+90)):($1**2) via k,q
plot [][200000:] "5a.dat" u ((4*pi/360)*($2+90)):($1**2) t "naměřené hodnoty", f(x)
set term epslatex
set output "5a.tex"
replot
set term wxt
replot
