reset
set key left top
set ylabel "$(U/\\mbox{V})^2$"
set xlabel "$\\Delta/\\mbox{rad}$"
f(x)=k*x+q
fit [0.1:] f(x) "5c.dat" u ((4*pi/360)*($2+90)):($1**2) via k,q
plot [][] "5c.dat" u ((4*pi/360)*($2+90)):($1**2) t "naměřené hodnoty", f(x)
set term epslatex
set output "5c.tex"
replot
set term wxt
replot
