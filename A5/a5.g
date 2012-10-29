reset
set xlabel "$p$/bar"
set ylabel "$T$/keV"
set key left
f(x)=a*x+b*x**2+c*x**3+f0
fit f(x) "a5.dat" u (3*$1):(-1)*($2-5485.73) via a,b,c,f0
plot [0:3][0:]  f(x) t "fitovaný polynom", "a5.dat" u (3*$1):(-1)*($2-5485.73) t "naměřená hodnoty"
set term epslatex
set output "g.tex"
replot
set term wxt
replot
