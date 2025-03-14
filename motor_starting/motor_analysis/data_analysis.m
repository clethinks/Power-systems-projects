
filename = 'motor_currents_spreadsheet.xlsx';
data = readtable(filename); 

time = data.Time_Sec__;  
motor1 = data.Current_DOL_; 
motor2 = data.Current_starDelta_;  


%%analysis
%current difference
current_difference = motor1 - motor2;

%peak current
peak_motor1 = max(motor1);
peak_motor2 = max(motor2);


% Energy Consumption 
energy_motor1 = trapz(time, motor1);
energy_motor2 = trapz(time, motor2);

% Rate of Change of Current
dt = diff(time); 
dI_motor1 = diff(motor1) ./ dt; 
dI_motor2 = diff(motor2) ./ dt; 

% Display Results
fprintf('Peak Current (DOL): %.2f A\n', peak_motor1);
fprintf('Peak Current (Star-Delta): %.2f A\n', peak_motor2);
fprintf('Energy Consumption (DOL): %.2f A·s\n', energy_motor1);
fprintf('Energy Consumption (Star-Delta): %.2f A·s\n', energy_motor2);

% Step 5: Plot Analysis Graphs

% Plot 1: Current Difference Over Time
figure;
subplot(3,1,1);
plot(time, current_difference, 'k-', 'LineWidth', 2);
xlabel('Time (s)');
ylabel('Current Difference (A)');
title('Current Difference Between DOL and Star-Delta');
grid on;

% Plot 2: Energy Consumption Bar Chart
subplot(3,1,2);
bar([energy_motor1, energy_motor2]); 
xticklabels({'DOL', 'Star-Delta'});
ylabel('Energy (A·s)');
title('Energy Consumption Comparison');
grid on;

% Plot 3: Rate of Change of Current
subplot(3,1,3);
plot(time(1:end-1), dI_motor1, 'b-', 'LineWidth', 2);
hold on;
plot(time(1:end-1), dI_motor2, 'r--', 'LineWidth', 2);
hold off;
xlabel('Time (s)');
ylabel('Rate of Change of Current (A/s)');
title('Current Rate of Change for DOL and Star-Delta');
legend('DOL', 'Star-Delta');
grid on;
