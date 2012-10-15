reset

set xlabel "$\\frac{R}{\\mathrm k\\Omega}$"
set ylabel "\\rotatebox{-90}{$\\frac{1/T}{\\mathrm{K^{-1}}}$}"
set title  "Graf 2: Z\\'avislost odporu na p\\v{r}evr\\'acen\\'e \
hodnot\\v{e} teploty"




set decimalsign ','
set fit errorvariables
set key top left

###########################################

Ri = 1
B = 1e-5

T(x) = log(x/Ri)/B


fit T(x) 'U09.dat' index 0 using ($5*1000):(1./$3) via B, Ri


set logscale x

#plot [1e-5:100][0:0.005] \


plot [0.05:100][0.0026:0.005] \
'U09.dat' index 0 using 5:(1./$3):6:($4/$3) with xyerrorbars title "$R(1/T)$" ps 0 lt 1 pt 1 ,\
T(x*1000) title "Prolo\\v{z}en\\'a z\\'avislost"


set term epslatex size 21cm,15cm
set out 'graf2.tex'
replot
set out
set term pop

########################################

set xlabel "$\\frac{U/I}{\\Omega}$"
set ylabel "\\rotatebox{-90}{$\\frac{UI}{\\mathrm{W}}$}"
set title  "Graf 3: Z\\'avislost v\\'ykonu na odporu"


unset logscale x

set key top right

T0 = 273.15 + 21

f(x) = (B/log(x/Ri) - T0)/K

fit f(x) 'U09.dat' index 1 using ($1/$3*1000):($1*$3/1000) via K

plot [0:700][0:0.042] \
'U09.dat' index 1 using ($1/$3*1000):($1*$3/1000):($1/$3*1000*($2/$1 + $4/$3)):($1*$3/1000*($2/$1 + $4/$3) ) with xyerrorbars title "$P(R)$"  ps 0 lt 1 pt 1,\
f(x) title "Prolo\\v{z}en\\'a z\\'vislost"



set print 'fit.txt'

print "Ri = "
print Ri
print Ri_err
print "B = "
print B
print B_err

set print

set term epslatex size 21cm,15cm
set out 'graf3.tex'
replot
set out
set term pop

#######################################

set xlabel "$\\frac{I}{\\mathrm{mA}}$"
set ylabel "\\rotatebox{-90}{$\\frac{U}{\\mathrm{V}}$}"
set title  "Graf 1: Z\\'avislost nap\\v{e}t\\'i na proudu"

set key right bottom spacing 1.3


unset logscale x

plot [0:26][0:2] \
'U09.dat' index 1 using 3:1:4:2 with xyerrorbars title "$U(I)$" ps 0 lt 1 pt 1, \
'U09.dat' index 1 using 3:1 smooth csplines title "$U(I)$" lt 2,\
0.176439*x title '$T_m$'


set term epslatex size 21cm,15cm
set out 'graf1.tex'
replot
set out
set term pop

plot [9:13][1.7:1.9] \
'U09.dat' index 1 using 3:1:4:2 with xyerrorbars title "$naměřená data$" ps 0 lt 1 pt 1, \
'U09.dat' index 1 using 3:1 smooth csplines title "$U(I)$" lt 2,\
0.176439*x title '$T_m$'

set logscale x
plot [0.05:100][0.0026:0.005] \
'U09.dat' index 0 using 5:(1./$3):6:($4/$3) with xyerrorbars title "$R(1/T)$" ps 0 lt 1 pt 1 ,\
T(x*1000) title "Prolo\\v{z}en\\'a z\\'avislost
