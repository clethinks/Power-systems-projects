function relay_code_number()
   
    relay_codes = containers.Map( ...
        {'1','2','37P','37','38','50', '51', '51G','51R','27', '59', '87', '32', '21','87B','87G','87GT','87S'}, ...
        {'Master element', ...
        'Time delay starting', ...
        'Underpower', ...
        'Undercurrent', ...
        'Bearing Protective device', ...
        'Instantaneous Overcurrent', ...
         'AC time Overcurrent', ...
         'Ground time overcurrent', ...
         'Locked/Stalled rotor', ...
         'Undervoltage', ...
         'Overvoltage', ...
         'Differential Protection', ...
         'Directional Power', ...
         'Distance Protection' ...
         'Bus differential', ...
         'Generator differential', ...
         'Generator/Transformer differential' ...
         'Stator differential', }...
    );

    
    relay_code = input('Enter ANSI relay code: ', 's');

    if isKey(relay_codes, relay_code)
        fprintf('ANSI Code %s: %s\n', relay_code, relay_codes(relay_code));
    else
        fprintf('ANSI Code %s not found in database.\n', relay_code);
    end
end
