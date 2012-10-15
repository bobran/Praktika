reset
set xlabel "$\\lambda$/nm"
set ylabel "$\\theta_i$"
set key left bottom
plot "g1.dat" u 1:2 smooth csplines t "$c_0$", "" u 1:3 smooth csplines t "$c_0/2$", "" u 1:4 smooth csplines t "$c_0/4$",\
"" u 1:2 notitle, "" u 1:3 notitle, "" u 1:4 notitle
set term epslatex
set output "g1.tex"
replot
set term wxt
replot
