function [sensitivity, specificity] = sensspec(detector, target)
%Calculation of the sensitivity and specificity, target and detector should
%be the same length
    n_tp = 0;
    n_fn = 0;
    n_tn = 0;
    n_fp = 0;
    for beat = 1:length(detector)
        if detector(beat) == 1 && target(beat) == 1
            n_tp = n_tp + 1;
        elseif detector(beat) == 0 && target(beat) == 1
            n_fn = n_fn + 1;
        elseif detector(beat) == 0 && target(beat) == 0
            n_tn = n_tn + 1;
        elseif detector(beat) == 1 && target(beat) == 0
            n_fp = n_fp + 1;
        end            
    end
    sensitivity = n_tp / (n_tp + n_fn);
    specificity = n_tn / (n_tn + n_fp);
end

