%-----------------------------------------------------
%
%      AUTHOR: Mingming Qiu         DATE: 14 Feb 2019
%    MODIFIED: Mingming Qiu         DATE: 15 Feb 2019

%       EMAIL: mq33982p@pace.edu
% DESCRIPTION: assignment 2 of CS631T Enhancement 
%                  and Binary Analysis Exercises
%        
%-----------------------------------------------------

disp('---------Finishing solving problem 1.a--------');
foodImg = imread('/Users/mingmingqiu/Desktop/CS 631T Computer Vision/week2/Food.jpg');

scaledFood =imadjust(foodImg);
imwrite(scaledFood,'ScaledFood.jpg');
subplot(1,2,1),imshow(foodImg),title('Original Food Image');
subplot(1,2,2),imshow(scaledFood),title('Scaled Food Image');
pause;

disp('---------Finishing solving problem 1.b--------');
hn1 = imhist(foodImg,255)/size(foodImg,1);
subplot(1,2,1),imhist(hn1),title('Food Image Nomalized Histogram');
subplot(1,2,2),imhist(foodImg,50),title('Food Image Calculated Histogram');
pause;

disp('---------Finishing solving problem 1.c--------');
EqImg = histeq(foodImg);
imwrite(EqImg,'EqualizedFood.jpg');
subplot(1,3,1),imshow(foodImg),title('Original Food Image');
subplot(1,3,2),imshow(EqImg),title('Equalized Food Image');
subplot(1,3,3),imhist(EqImg),title('Equalized Food Histgram Img');
pause;

disp('---------Finishing solving problem 2--------');
OriImg= imread('/Users/mingmingqiu/Desktop/CS 631T Computer Vision/week2/shapes.tiff');
se = strel('square',20);
se2 = strel('square',36);

% Opening: erode + dilate => remove the oject that are smaller than SE
%          remove small gaps or spaces between touching objects
BErodeImg=imerode(OriImg,se);
BImg = imdilate(BErodeImg,se);
subplot(2,2,1),imshow(OriImg),title('(a)Original image');
subplot(2,2,2),imshow(BImg), title('(b)The desired image1');

% closing: dilate + erode => fuses small holes
CDiateImg = imdilate(OriImg,se);
CImg = imerode(CDiateImg,se);
subplot(2,2,3),imshow(CImg), title('(c)The desired image2');

% erode: shrink feature with 20x20 SE (remove bridge,and right narrow part)
% dialte: SE2 > SE enlarge object, eliminate small hole(20X20 pixel)
% erode: shrink object to orignial size with SE 20X20 
DImg = imerode(dialate,se);
D1Img = imdilate(DImg,se2);
D2Img = imerode(D1Img,se);
subplot(2,2,4),imshow(D2Img), title('(D)The desired image3');
pause;

disp('---------Finishing solving problem 3--------');
% Erosion size variation
wireImg = imread('/Users/mingmingqiu/Desktop/CS 631T Computer Vision/week2/Wirebond.tiff');
se = strel('sphere',10);
se1 = strel('sphere',5);
se2 = strel('sphere',16);

BImg = imerode(wireImg,se);
CImg = imerode(wireImg,se1);
DImg = imerode(wireImg,se2);
subplot(1,4,1),imshow(wireImg),title('(a)Original image');
subplot(1,4,2),imshow(BImg),title('(b)The desired image 1');
subplot(1,4,3),imshow(CImg),title('(c)The desired image 2');
subplot(1,4,4),imshow(DImg),title('(d)The desired image 3');
pause;

disp('---------Finishing solving problem 4--------');
OriImg= imread('/Users/mingmingqiu/Desktop/CS 631T Computer Vision/week2/City.jpg');
se = strel('square',3);
A = imdilate(OriImg,se);
B = imerode(OriImg,se);
C = A - B;
figure,imshow(B),title('Resultant Image C');
disp('Discuss: The image A is a enlarge feature of original photo, The image B is a shrink feature photo, let C = A-B, which means an outline of feature was cut out. So, In the picture C, black part is the same part of A and B. White/Gray part is outline of feature.');
pause;
close all;
clear;