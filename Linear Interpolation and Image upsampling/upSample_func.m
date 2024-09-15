function [outputArray] = upSample_func(inputArray)
imgArray = double(inputArray);
outputArray = zeros(2*size(imgArray));
outputArray(1:2:end, 1:2:end) = inputArray;

% Row interpolation
outputArray(1:2:end, 2:2:end-2) = 0.5 * (outputArray(1:2:end, 1:2:end-3) + outputArray(1:2:end, 3:2:end-1));
outputArray(1:2:end, end) = outputArray(1:2:end, end-1);

% Column interpolation
outputArray(2:2:end-2, :) = 0.5 * (outputArray(1:2:end-3, :) + outputArray(3:2:end-1, :));
outputArray(end, :) = outputArray(end-1, :);

outputArray = uint8(outputArray);

end