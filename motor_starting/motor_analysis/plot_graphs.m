clear
clc
filename = 'motor_currents_spreadsheet.xlsx';
data = readtable(filename);

time = data.Time_Sec__;  
motor1 = data.Current_DOL_; 
motor2 = data.Current_starDelta_; 

%%plot
figure;
plot(time, motor1); 
hold on;
plot(time, motor2, 'r--', 'LineWidth', 2); 
hold off;


xlabel('Time (s)'); 
ylabel('Current (A)'); 
title('Motor Starting Methods: DOL vs. Star-Delta'); 
legend('DOL Start', 'Star-Delta Start'); 
grid on; 
