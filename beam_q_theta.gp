reset

# Set the format of the output file 
set term png

set grid back

# Loop over all files 
do for [i=1:50]{

     # Update the value of alpha
     alpha=((0.5*pi)/50)*i

     # Set the output file 
     set output sprintf("beam_q_theta%d.png",i)

     # Set the plot range
     set yrange [-0.08:0.08]
     set xrange [0:0.5]

     # Set the ticks of the x-axis and y-axis
     set xtics("0" 0, "0.1" 0.1, "0.2" 0.2, "0.3" 0.3, "0.4" 0.4, "0.5" 0.5)
     set ytics("-0.08" -0.08,"-0.06" -0.06,"-0.04" -0.04,"-0.02" -0.02,"0" 0, "0.02" 0.02, "0.04" 0.04, "0.06" 0.06, "0.08" 0.08)

     # Set labels for the axes
     set xlabel "q"
     set ylabel "{/symbol q}_{eq}"

     # Set title for the plot
     set title "Comparison of the results between oomph and warm-up project ({/symbol a}=0.01π...0.5π)"

     # Assign file to the file handle 
     file = sprintf("beam_q_theta_eq%d.dat",i)
     file2 = sprintf("analytical_straight_alpha_theta%d.dat",i)

     # Write the additional information to the plot 
     set label 1 sprintf("{/symbol a} = %.2fπ, I = 0.0", alpha/pi) at screen 0.97, 0.02 right front font ",15"

     # Plot the figures 
     plot file using 1:(strcol(4) eq "#" ? 1/0 : $4) with points pointsize 1.2 pointtype 8 lc rgb "blue" title "oomph", \
          file using 1:(strcol(6) eq "#" ? 1/0 : $6) with points pointsize 1.2 pointtype 8 lc rgb "blue" title "", \
          file2 using 1:(strcol(3) eq "#" ? 1/0 : $3) with lines linewidth 2 lc rgb "red" title "warm-up project", \
          file2 using 1:(strcol(4) eq "#" ? 1/0 : $4) with lines linewidth 2 lc rgb "red" title ""
}
