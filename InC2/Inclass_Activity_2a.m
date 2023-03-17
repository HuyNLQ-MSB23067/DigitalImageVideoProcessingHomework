%In-class activity 02a
%Convert the objects' color as follows: the square to red, the rectangle to green,
%the pentagon to blue, the circle to magenta and the star to cyan

clear, clc, close all;

%load image
Img = imread('shapes.png');

%convert to gray level image
GrayImg = rgb2gray(Img);
GrayImg(1:20,:) = 255;

%binarize image
level = graythresh(GrayImg);
bwImg = 1 - im2bw(GrayImg, level);

%convert colors
L = bwlabel(bwImg, 8);
cmap = [255 0 255; 255 0 0; 0 255 0; 0 255 255; 0 0 255] ./ 255;
%[magenta red green cyan blue]
rgblabel = label2rgb(L, cmap, 'white');

minpolysize = 2000; %minimum area to consider as an object
bg = L > 0;
regs = regionprops(bg, 'Area', 'Centroid', 'PixelIdxList');
regs(vertcat(regs.Area) < minpolysize) = []; %ignore small objects

figure, clf;
subplot(1, 3, 1), imshow(Img), title('Original Image');
subplot(1, 3, 2), imshow(bwImg), title('Binarized Image');
subplot(1, 3, 3), imshow(rgblabel), title('Converted Image');