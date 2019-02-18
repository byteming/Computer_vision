%-----------------------------------------------------
%
%      AUTHOR: Mingming Qiu         DATE: 14 Feb 2019
%    MODIFIED: Mingming Qiu         DATE: 17 Feb 2019

%       EMAIL: mq33982p@pace.edu
% DESCRIPTION: assignment 2 of CS631T Enhancement 
%                  and Binary Analysis Exercises
%        
%-----------------------------------------------------

disp('---------Finishing solving problem 1.a--------');
foodImg = imread('Food.jpg');

scaledFood =imadjust(foodImg,[.3 .7]);
imwrite(scaledFood,'ScaledFood.jpg');
subplot(1,2,1),imshow(foodImg),title('Original Food Image');
subplot(1,2,2),imshow(scaledFood),title('Scaled Food Image');
pause;

disp('---------Finishing solving problem 1.b--------');
hn1 = imhist(foodImg,255);
subplot(1,2,1),bar(hn1,1),title('Food Image Nomalized Histogram');
subplot(1,2,2),imhist(foodImg,50),title('Food Image Calculated Histogram');
pause;

disp('---------Finishing solving problem 1.c--------');
EqImg = histeq(foodImg);
imwrite(EqImg,'EqualizedFood.jpg');
subplot(1,3,1),imshow(foodImg),title('Original Food Image');
subplot(1,3,2),imshow(EqImg),title('Equalized Food Image');
subplot(1,3,3),imhist(EqImg),title('Equalized Food Histgram Img');
%subplot(1,3,3),bar(imhist(EqImg,50),1),title('Equalized Food Histgram Img');
pause;
close all;
clear;

disp('---------Finishing solving problem 2--------');
OriImg= imread('shapes.tiff');
se = strel('square',20);
se2 = strel('square',36);

BImg = imopen(OriImg,se);
CImg = imclose(OriImg,se);

subplot(2,2,1),imshow(OriImg),title('(a)Original image');
subplot(2,2,2),imshow(BImg), title('(b)The desired image1');
subplot(2,2,3),imshow(CImg), title('(c)The desired image2');

DImg = imerode(OriImg,se);
D1Img = imdilate(DImg,se2);
D2Img = imerode(D1Img,se);
subplot(2,2,4),imshow(D2Img), title('(D)The desired image3');
pause;
close all;
clear;

disp('---------Finishing solving problem 3--------');
% Erosion size variation
wireImg = imread('Wirebond.tiff');
se = strel('sphere',10);
se1 = strel('sphere',5);
se2 = strel('sphere',16);

BImg = imerode(wireImg,se);
CImg = imerode(wireImg,se1);
DImg = imerode(wireImg,se2);
subplot(2,2,1),imshow(wireImg),title('(a)Original image');
subplot(2,2,2),imshow(BImg),title('(b)The desired image 1');
subplot(2,2,3),imshow(CImg),title('(c)The desired image 2');
subplot(2,2,4),imshow(DImg),title('(d)The desired image 3');
pause;

disp('---------Finishing solving problem 4--------');
OriImg= imread('City.jpg');
se = strel('square',3);
A = imdilate(OriImg,se);
B = imerode(OriImg,se);
C = A - B;
figure,imshow(B),title('Resultant Image C');
disp('Discuss: The image A is a enlarge feature of original photo, The image B is a shrink feature photo, let C = A-B, which means an outline of feature was cut out. So, In the picture C, black part is the same part of A and B. White/Gray part is outline of feature.');
pause;
close all;
clear;