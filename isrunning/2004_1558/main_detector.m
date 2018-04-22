%% Preprocessing
% loading all data
loaddata

% inputs
RRinterval = rr2;
target = tarRR2;
window_size = 30;
start_point = 20;
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
detectorCV = CV(RRinterval, window_size, start_point, step_size, 0.015); %Threshold missing
%Poincare()
detectorPC = poinc(RRinterval, window_size, step_size); % how to analyze this?



%% Analysis
[sensCV, specCV] = sensspec(detectorCV, target)
[sensPC, specPC] = sensspec(detectorPC, target)