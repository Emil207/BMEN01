%% Load data
loaddata
%% Coefficient of variation (CV)
start_point = 51;
stop = 40000;
window_length = 100;
step_size = 1;

for beat = start_point:length(RRinterval)-window_length
    currentValues = RRinterval(beat-window_length/2:beat+window_length/2);
    CV(beat) = var(currentValues)/mean(currentValues);   
end

threshold = 0:0.001:0.1;
sens = zeros(1,length(threshold));
spec = zeros(1,length(threshold));
for i = 1:length(threshold)
    detector = zeros(1,intlength);
    target = tarRR1(start:start+intlength);
    for beat = 1:intlength-window_length
        if cv(beat) > threshold(i)
            detector(beat) = 1;
        end          
    end
    [sens(i) spec(i)] = sensspec(detector, target);
end
plot(threshold, sens+spec)
figure
plot(sens, spec)
figure
plot(threshold, sens)
%ylim([-0.2 1.3])

