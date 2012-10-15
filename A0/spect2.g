reset
set logscale y
plot [100:3000] "output2.txt" u 1:2  with lines
set xlabel "$E$/keV"
set ylabel "N"
set xtics ("" 510.95,"" 856.83, "" 1642.51, "Cl" 2167.28, "" 1731.84,"" 2242.77,"Na" 2753.83, "J" 416.88, "Na$^2$" 1368.50)
set label "anti" at 450, 500
set label "Na$^2_{SEP}$" at 850, 50
set label "Cl$_{SEP}$" at 1600, 10
set label "Na$_{DEP}$" at 1700, 20
set label "Na$_{SEP}$" at 2200, 10
unset key
set term epslatex
set output "spect2.tex"
replot
set term wxt
replot
