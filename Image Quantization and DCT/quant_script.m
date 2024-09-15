clear all;
close all;
inputs = [1,  4, 10,  20, 50, 100];
outputx = zeros(size(inputs));
outputy1 = outputx;
outputy2 = outputx;

for i = 1:length(inputs)
    outputx(i) = inputs(i);
    [temp1, temp2] = a3F(inputs(i));
    outputy1(i) = temp1;
    outputy2(i) = temp2;

    pause(1);
end

figure;
fig1 = tiledlayout(2, 1);

% First plot
nexttile;
plot(outputx, outputy1, 'r-');  % 'r-' specifies a red line
title('Number of Non-Zero Coefficients vs Quantization Step Sizes');
xlabel('Quantization Step Sizes');
ylabel('Number of Non-Zero Coefficients');
grid on;  % Add a grid

% Second plot
nexttile;
plot(outputx, outputy2, 'b-');  % 'b-' specifies a blue line
title('MSE vs Quantization Step Sizes');
xlabel('Quantization Step Sizes');
ylabel('MSE');
grid on;  % Add a grid