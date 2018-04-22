function detectorCV = CV(RRinterval, window_size, start_point, step_size, threshold)
% Calculates the detector value with Coefficient of Variation
    RRlength = length(RRinterval);
    CV = zeros(1,RRlength);
    for beat = start_point:RRlength-window_size
        currentValues = RRinterval(beat-window_size/2:beat+window_size/2);
        CV(beat) = var(currentValues)/mean(currentValues);
        if CV(beat) > threshold
            detectorCV(beat) = 1;
        end     
    end
    
    
end

