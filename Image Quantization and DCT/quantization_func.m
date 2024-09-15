function [nonZeros, mse] = quantization_func(stepSize)
close all;
img = imread("test_img.pgm"); %insert any image pgm file here
figure;
imshow(img);
img_data = double(img);

T = dct(eye(8));
reconstrucedImg = zeros(size(img));


nonZeros = 0;

img = padarray(img, mod(8 - mod(size(img), 8), 8), 'post');
for i = 1:8:size(img, 1)
    for j = 1:8:size(img, 2)
        block = double(img(i:i+7, j:j+7));
        dcts = T * block * T';

        quantized = round(dcts / 10) * 10;

        nonZeros = nonZeros + nnz(quantized);

        reconstructedBlock = T' * quantized * T;
        reconstructedImg(i:i+7, j:j+7) = reconstructedBlock;

        if i == 1 && j == 1
            disp('Original image block:');
            disp(block);
            disp('Original 2D DCT coefficients:');
            disp(dcts);
            disp('Reconstructed 2D DCT coefficients:');
            disp(quantized);
            disp('Reconstructed block after inverse DCT:');
            disp(reconstructedBlock);
        end
    end
end


disp('Number of non-zero coefficients:');
disp(nonZeros);

roundedReconstructedImg = round(reconstrucedImg);
roundedReconstructedImg(reconstructedImg > 255) = 255;
roundedReconstructedImg(reconstructedImg < 0) = 0;


mse = sum(sum((double(img) - double(roundedReconstructedImg)).^2)) / numel(img);
disp('mse')
disp(mse)

newImg = uint8(reconstructedImg);
figure;
imshow(newImg);
end

