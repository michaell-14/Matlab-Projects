clear all
close all

img = imread('sample.pgm');
figure;
imshow(img);
disp(size(img))
disp(img(end-1:end, end-1:end));

figure;
img2 = upSample_func(img);
imshow(img2);
disp(size(img2))
disp(img2(end-3:end, end-3:end));
imwrite(img2, ['sample1.pgm']);

figure;
img4 = upSample_func(img2);
imshow(img4);
disp(size(img4))
disp(img4(end-7:end, end-7:end));
imwrite(img4, ['sample3.pgm']);

