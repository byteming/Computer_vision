%-----------------------------------------------------
%
%      AUTHOR: Mingming Qiu         DATE: 29 March 2019
%    MODIFIED: Mingming Qiu         DATE: 1 April 2019

%       EMAIL: mq33982p@pace.edu
% DESCRIPTION: Assignment 5 ? Color Image Processing
%        
%-----------------------------------------------------
disp('---------Fishing solving problem 1.a--------');

img = imread('/Users/mingmingqiu/Desktop/CS 631T Computer Vision/week5/ball.bmp');
mymethordimg = Myrgb2hsi(img);
matlabimg = rgb2hsv(img);
figure;
subplot(1,3,1),imshow(img),title('Orignial');
subplot(1,3,2),imshow(matlabimg),title("Matlab function HSI");
subplot(1,3,3),imshow(mymethordimg),title("My function HSI");

disp("HSI is more suited for decribing how human perceive color, Lgitt hits the retina,these convert the spectrum into a few discret values");
pause;
disp('---------Fishing solving problem 1.b--------');
I = rgb2gray(img);
imgS = edge(I,'Sobel');
imgP = edge(I,'Prewitt');
imgR = edge(I,'Roberts');
imgLG = edge(I,'log');
imgC = edge(I,'Canny',0.2);
figure;
subplot(2,3,1),imshow(img),title('Original');
subplot(2,3,2),imshow(imgS),title('Sobel');
subplot(2,3,3),imshow(imgP),title('Prewitt');
subplot(2,3,4),imshow(imgR),title('Roberts');
subplot(2,3,5),imshow(imgLG),title('Laplacian of Gaussian');
subplot(2,3,6),imshow(imgC),title('Canny');
disp('If I using default threshold, sobel and Prewitt give me good picute with edges. But after change threshold of Canny, I get best picure edge fro Canny.');
disp("The ideal case, after applying edge detector to the image may lead to indicate the bounaries of objects, and filter out information less relevant");
pause;
disp('---------Fishing solving problem 1.c--------');
imshow(I)
d = imdistline;
for i = 1:400
    for j = 1:600
        if((img(i,j,1)>130&img(i,j,2) <100 & img(i,j,3)<100) == 0)
            img(i,j,1)=0;
            img(i,j,2) = 0;
            img(i,j,3) =0;
        end
    end
end
figure(2);imshow(img);
SE = strel('sphere',1);
f3 = imdilate(img,SE);
figure(3);imshow(f3);
pause;
s = regionprops(f3,'centroid');
centroids = cat(1,s.Centroid);
imshow(f3)
hold on
plot(centroids(:,1),centroids(:,2),'b*')
hold off
imtool(img);
centroid =[380,290];
centroid
pause;
clear;
close all;

function [HSI] = Myrgb2hsi(img)
%represent the RGB image in[0 1] range
A = double(img)/255;
R = A(:,:,1);
G = A(:,:,2);
B = A(:,:,3);
% Hue value
upPart = 0.5 * ((R-G)+(R-B));
DePart = ((R -G).^2 + ((R-B).*(G-B))).^0.5;
H = acosd(upPart./(DePart+ 0.0000001));
%If B >G then H = 360 - Theta
H(B>G) = 360 - H(B>G);
H = H /360;

% Saturation
S = 1 - (3./(sum(A,3) + 0.000001)).*min(A,[],3);

% Intensity
I = sum(A,3)./3;

%HSI
HSI = zeros(size(img));
HSI(:,:,1) = H;
HSI(:,:,2) = S;
HSI(:,:,3) = I;
end