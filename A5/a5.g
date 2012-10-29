reset
f(x)=a*x+b*x**2+c*x**3+f0
fit f(x) "a5.dat" u (3*$1):2 via a,b,c,f0
plot [0:3]  f(x), "a5.dat" u (3*$1):2
