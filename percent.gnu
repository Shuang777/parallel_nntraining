set term png
set output "percent.png"
set logscale x 2
set term png font 11

set yr [0:25]
set xr [1:32]
set xlabel "Number of GPUs"
set ylabel "Percentage of time on MPI"
set format y "%g"

plot "percent.dat" using 1:($2*100) title 'All-reduce MPI time percentage' with linespoints axes x1y1, \
#     "percent.dat" using 1:($3*100) title 'Butterfly MPI time percentage' with linespoints axes x1y1
