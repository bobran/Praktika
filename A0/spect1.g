reset
set logscale y
plot [100:3000] "output.txt" u 1:2  with lines
set xlabel "$E$/keV"
set ylabel "N"
set xtics (195, "" 480, 500, "" 552, "Cs" 660, 1000, 1500, 2000, 2500)
set label "hz" at 155, 5000
set label "h1" at 450, 2000
set label "h2" at 540, 500
unset key
set term epslatex
set output "spect1.tex"
replot
set term wxt
replot
