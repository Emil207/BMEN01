%% Preprocessing
% loading all data
loaddata

% inputs
RRinterval = rr1;
target = tarRR1;
window_size = 30;
start_point = 51;
step_size = 1;


% check for correct values
if window_size >= length(RRinterval)
    error('window_size too large. Has to be < length(RRinterval)!')
elseif start_point >= (length(RRinterval-window_size/2))
    error('start_point is not within valid range. Has to be <(length(RRinterval)-window_size/2)')
elseif start_point<window_size/2
    error('start_point is not within valid range. Has to be larger than half the windowsize')
else
end

%% Methods
detectorCV = CV(RRinterval, window_size , step_size, 0.022); %Threshold missing
%Poincare()
detectorPC = poinc(RRinterval,30,1);% window_size, step_size); 

%
detector= zeros(1, length(RRinterval)); % cut rr interval size
z=1;
for z = (1:length(detector))
    if (detectorCV(z)==1) && (detectorPC(z)==1)
        detector(z)=1;
        
    else
        detector(z)=0;
    end
end
%% Analysis
[sensCV, specCV] = sensspec(detectorCV, target)
[sensPC, specPC] = sensspec(detectorPC, target)
[sens, spec] =sensspec(detector, target)

hold on
plot(rr1)
%plot(detector);
plot(target);
title('data 1');
legend('RR-interval', 'Target' )

hold on
plot(rr1)
plot(target);
title('data 1');
legend('RR-interval', 'Target' )

figure
hold on
plot(detector);
plot(target);
title('data 1');
legend('Detector', 'Target' )



