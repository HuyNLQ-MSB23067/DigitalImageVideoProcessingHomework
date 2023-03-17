%In-class activity 02b
% a) Convert the original image to binary and display the result
% b) User erosion and/or dilation to draw the edge of objects
% c) Generate a structuring element as below. Could we count the number of coins using it?
%    0 1 1 0
%    1 0 0 1
%    1 0 0 1
%    0 1 1 0

clear, clc, close all;

%load image
Img = imread('coins.jpeg');

% a. Binarize image
%binarize image
level = graythresh(Img);
bwImg = im2bw(Img, level);
%bwImg = imbinarize(Img, level);
figure, clf;
imshow(bwImg), title('Binarized Image');

% b. choose structure element
se = strel('disk', 10, 0);
Img_dilated = imdilate(Img, se);
Img_eroded = imerode(Img, se);
edge1 = Img_dilated - Img;
edge2 = Img - Img_eroded;
edge3 = edge1 + edge2;
figure, clf;
imshow(edge3), title('Detected Edges');

% c. create own structuring element
se1 = [0 1 1 0; 1 0 0 1; 1 0 0 1; 0 1 1 0];
Img_dilated = imdilate(Img, se1);
Img_eroded = imerode(Img, se1);
edge1 = Img_dilated - Img;
edge2 = Img - Img_eroded;
edge3 = edge1 + edge2;
figure, clf;
imshow(edge3), title('Detected Edges by custom SE');
