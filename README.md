# Digital clock with FPGA #

In this project we Implemented a 24-Hr Verilog Digital Clock on FPGA, we used 7-segment displays to display hours and minutes and board-buttons for
setting time.

### Hardware Used:
- Zynq-7000 System-on-Chip (SoC) Zedboard
- 4 seven-segment displays(2 common anode and 2 common cathode)
<img src="https://github.com/ahad18abd/FPGA-clock/blob/master/images/zedboard.webp" width="50%" height="50%" >
<img src="https://github.com/ahad18abd/FPGA-clock/blob/master/images/7segment.jpeg" width="10%" height="10%" >

### Enviroment/Software
- Xilinx Vivado
- Verilog

### Concept
To design a full digital clock first we designed clocks of different frequencies for minutes and hours.
and maxing time clock can show is 23:59
so Using these clock, we implemented counter with following constrains:
* Minute Unit-digit with clock of frequency 1/60 Hz, that counts from 0-9
* Minute Tenth-digit with clock of frequency 1/600 Hz, that counts from 0-5
* Hour Unit-digit with clock of frequency 1/3600 Hz, that counts from 0-3
* Hour Tenth-digit with clock of frequency 1/36000 Hz, that counts from 0-2

For displaying these counter as decimal digits, we used 7 segment displays and implemented logic accordingly.
<img src="https://github.com/ahad18abd/FPGA-clock/blob/master/images/maxresdefault.jpg" width="50%" height="50%" >

Here comes the tricky part,To use 4 displays we need 8x4=32 output pins, Zynq-7000 zedboard doesn't have these many pins :(.
So we connected seven segment dispalys in couple with same pins, and switched on-off alternatively with high frequency such that toggling is not visible to human eyes.
To set time we used board buttons,On turning on set button corresponding to any digit, it start counting with frequency 1 Hz, we can turn off set button at required time, and it starts counting from there with it's original frequnecy.


### Reference
* https://www.fpga4student.com/2017/09/seven-segment-led-display-controller-basys3-fpga.html
