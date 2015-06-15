set term png
set output "scaling.png"
set logscale x 2
set term png font 11

set yr [0:110]
set xr [1:18]
set xlabel "Number of GPUs"
set ylabel "Strong scaling factor"
set format y "%g"

set ytics nomirror
set y2tics
set y2label "Speedup factor"
set y2r [0:13]

plot "scaling.dat" using 1:($2*100) title 'All-reduce scaling factor' with linespoints axes x1y1, \
     "scaling.dat" using 1:($3*100) title 'Butterfly scaling factor' with linespoints axes x1y1, \
     "scaling.dat" using 1:4 title 'All-reduce speedup factor' with linespoints axes x1y2, \
     "scaling.dat" using 1:5 title 'Butterfly speedup factor' with linespoints axes x1y2
