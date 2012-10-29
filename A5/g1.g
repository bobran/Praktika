reset
set xlabel "$x$/cm"
set ylabel "$h$/keV$\\cdot$m$^{-1}$"
unset key
f(x)=109.2*x**2-154-x+890
plot [0:3] f(x)
set term epslatex
set output "g1.tex"
replot
set term wxt
replot

