%-----------------------------------------------------
%
%      AUTHOR: Mingming Qiu         DATE: 7 Feb 2019
%    MODIFIED: Mingming Qiu         DATE: 8 Feb 2019

%       EMAIL: mq33982p@pace.edu
% DESCRIPTION: assignment 1 of CS631T Matlab Warm-up Exercises
%        
%-----------------------------------------------------


disp('---------Fishing solving problem 1--------');
A = imread('/Users/mingmingqiu/Desktop/CS 631T Computer Vision/week1/peppers.bmp');
figure,imshow(A),title('RGB Original Image');
pause;
disp('----Test ReduceGrayScale Function-----');
A1= ReduceGrayScale(A);
figure,imshow(A1);
pause;

disp('---------Fishing solving problem 2--------');
B=rgb2gray(A);
TB=transpose(B);
subplot(1,2,1),imshow(B),title('B')
subplot(1,2,2),imshow(TB),title('TB')
disp('Maximum intensity value of B:'),disp( max(max(B)));
disp('Minimum intensity value of B:'),disp( min(min(B)));
disp('Mean intensity value of B:'),disp( mean(mean(B)));
disp('Median intensity value of B:'),disp( median(median(B)));
pause;

disp('---------Fishing solving problem 3--------');
C =double(B)/double(max(max(B)));
figure,imshow(C), title('Normalize Gray Scale Image');
pause;

disp('---------Fishing solving problem 4--------');
D1=C.^0.25;
D2=C.^1.25;
D=[D1,D2];
subplot(2,1,1),imshow(D1),title('Power .25');
subplot(2,1,2), imshow(D2),title('Power 1.25');
disp('Explain: power .25 is decrease picture intensity until 1/4 left; while, power 1.25 increase the intensity of picutre 1/4.');
imwrite(D2,'Mingming_D2.jpg');
pause;

disp('---------Fishing solving problem 5--------');
threshold = 0.3;
bw1 =zeros(size(B));
bw1(C>threshold) =1;
bw2 = im2bw(C,0.3);
%figure,imshow(bw1);
%figure,imshow(bw2);
disp("My method worked.");
subplot(1,2,1),imshow(bw1),title('My Method');
subplot(1,2,2),imshow(bw2),title("Matlab method");
pause;

disp('---------Fishing solving problem 6--------');
close all;
clear;


disp('---------Fishing solving problem 7 Fuction ReduceGrayScale--------');
    function img_output =ReduceGrayScale(img_input)
        imgsize = size(img_input);
        img_output = uint8(zeros(imgsize(1),imgsize(2)));

        for r = 1:1:imgsize(1)
            for c = 1:1:imgsize(2)
             img_output(r,c)= fix(double(img_input(r,c))/4);
            end
        end
    end




