P(x)=p0+p1*x+p2*x**2+p3*x**3+p4*x**4+p5*x**5+p6*x**6
u(x)=u0+u1*x+u2*x**2+u3*x**3+u4*x**4+u5*x**5+u6*x**6
F(x)=f0+f1*x+f2*x**2+f3*x**3+f4*x**4+f5*x**5+f6*x**6
fit P(x) "g1.dat" u 1:6 via p0,p1,p2,p3,p4,p5,p6
fit u(x) "g1.dat" u 1:8 via u0,u1,u2,u3,u4,u5,u6
fit F(x) "g1.dat" u 1:(acos($8)) via f0,f1,f2,f3,f4,f5,f6
plot "g1.dat" u 1:6:7 with yerrorbars t "P",\
"g1.dat" u 1:8:9 with yerrorbars t "$\\cos\\varphi$",\
"g1.dat" u 1:(acos($8)):($1**0.3*($9/$8)/3) with yerrorbars t "$\\varphi$"
set xlabel "$C/\\mu$F"
set y2label "$P/$W"
set term epslatex
set output "g1.tex"
replot
set term wxt
replot



