reset
set xlabel "$\\lambda$/nm"
set ylabel "$\\theta_i$"
set key left top
set xtics ("$\\lambda_0$" 410.45 ,"$\\lambda_1$" 561.27, 450, 500, 600, 650, 700)
plot "g2.dat" u 1:2 smooth csplines t "$c_0/2$", "" u 1:3 smooth csplines t "$c_0/2\\cdot c_{MgSO4}$", "" u 1:4 smooth csplines t "$c_0/2\\cdot 5c_{MgSO4}$",\
"" u 1:2 notitle, "" u 1:3 notitle, "" u 1:4 notitle
set term epslatex
set output "g2.tex"
replot
set term wxt
replot
