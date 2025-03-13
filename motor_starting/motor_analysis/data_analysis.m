% Step 1: Load the spreadsheet data
filename = 'motor_currents_spreadsheet.xlsx'; % Change to your actual file name
data = readtable(filename); % Reads the table with headers

% Step 2: Extract relevant columns and convert them to arrays
time = data{:, "Time_Sec__"};      % Extract 'Time' column
motor1 = data{:, "Current_DOL_"};  % Extract 'Motor1' column (DOL)
motor2 = data{:, "Current_starDelta_"};  % Extract 'Motor2' column (Star-Delta)

% Step 3: Compute Analysis Metrics

% (1) Current Difference at Each Time Step
current_difference = motor1 - motor2;

% (2) Peak Current
peak_motor1 = max(motor1);
peak_motor2 = max(motor2);

% (3) Time to Steady-State (Last 10% Considered Steady-State)
steady_threshold1 = 0.1 * peak_motor1; 
steady_threshold2 = 0.1 * peak_motor2; 

steady_index_motor1 = find(motor1 < steady_threshold1, 1, 'last');
steady_index_motor2 = find(motor2 < steady_threshold2, 1, 'last');

steady_time_motor1 = time(steady_index_motor1);
steady_time_motor2 = time(steady_index_motor2);

% (4) Energy Consumption (Approximate Integration using Trapezoidal Rule)
energy_motor1 = trapz(time, motor1);
energy_motor2 = trapz(time, motor2);

% (5) Rate of Change of Current (Derivative)
dt = diff(time); % Time intervals
dI_motor1 = diff(motor1) ./ dt; % Current rate of change for Motor 1
dI_motor2 = diff(motor2) ./ dt; % Current rate of change for Motor 2

% Step 4: Display Results
fprintf('Peak Current (DOL): %.2f A\n', peak_motor1);
fprintf('Peak Current (Star-Delta): %.2f A\n', peak_motor2);
fprintf('Time to Steady-State (DOL): %.2f s\n', steady_time_motor1);
fprintf('Time to Steady-State (Star-Delta): %.2f s\n', steady_time_motor2);
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
