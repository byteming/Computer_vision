%-----------------------------------------------------
%
%      AUTHOR: Mingming Qiu         DATE: 22 Feb 2019
%   
%       EMAIL: mq33982p@pace.edu
% DESCRIPTION: assignment 3 of CS631T Matlab 
%        
%-----------------------------------------------------
img = imread('Circuit.jpg');
img3 = AverageFilter(img);
img5 = AverageFilter5(img);

disp('--Finish Solving Problem 1(A)--')

subplot(1,3,1),imshow(img),title('Original image');
subplot(1,3,2),imshow(img3),title('Average 3X3 image');
subplot(1,3,3),imshow(img5),title('Standard 5X5 image');
pause;

bH3 = fspecial('average');
img3filter2 = filter2(bH3,img);
bH5 = fspecial('average',5);
img5filter2 = filter2(bH5,img);

disp('--Finish Solving Problem 1(B)--')

subplot(2,2,1),imshow(img3filter2),title('Average 3X3 image');
subplot(2,2,2),imshow(img3filter2),title('Standard 5X5 image');
subplot(2,2,3),imshow(img3),title('Average 3X3 image--My Method');
subplot(2,2,4),imshow(img5),title('Standard 5X5 image--My Method');
disp('Compare these 4 pictures results are different.')
pause;

disp('--Finish Solving Problem 1(C)--')
imgMedian3 = MedianFilter(img);
imgMedian5 = MedianFilter5(img);

subplot(1,3,1),imshow(img),title('Original image');
subplot(1,3,2),imshow(uint8(imgMedian3)),title('Median weighted 3X3 image');
subplot(1,3,3),imshow(uint8(imgMedian5)),title('Median 5X5 image');
pause;

disp('--Finish Solving Problem 1(D)--')
D3 = medfilt2(img);
D5 = medfilt2(img, [5 5]);
subplot(2,2,1),imshow(D3),title('Median 3X3 image');
subplot(2,2,2),imshow(D5),title('Median 5X5 image');
subplot(2,2,3),imshow(uint8(imgMedian3)),title('Median weighted 3X3 image--My method');
subplot(2,2,4),imshow(uint8(imgMedian5)),title('Median 5X5 image--My method');
pause;

disp('--Finish Solving Problem 1(E)--')
imgE = imread('Moon.jpg');
f = fspecial('laplacian');
imgE = im2double(imgE);
imgE2 = imfilter(imgE,f);
imwrite(imgE2, 'laplacian.jpg')
EScaled  = (imgE2 - min(min(imgE2)))/(max(max(imgE2)) - min(min(imgE2)));
EEnhanced = imsubtract(imgE,imgE2);

subplot(2,2,1),imshow(imgE),title('Original Image')
subplot(2,2,2),imshow(imgE2,[]),title('Filtered Image')
subplot(2,2,3),imshow(EScaled),title('Scaled Image')
subplot(2,2,4),imshow(EEnhanced,[]),title('Enhanced Image')
pause;

close all;
clear;


function filtered_img = AverageFilter(noisy_img)
    [m,n] = size(noisy_img);
    filtered_img = uint8(zeros(m,n));
    
    for i = 2:m-1
        for j = 2:n-1
            flt =[noisy_img(i-1,j-1),noisy_img(i-1,j),noisy_img(i-1,j+1),noisy_img(i,j-1),noisy_img(i,j),noisy_img(i,j+1),noisy_img(i+1,j-1),noisy_img(i+1,j),noisy_img(i+1,j+1)];
            filtered_img(i,j) = mean(flt);
        end
    end
end

function filtered_img = AverageFilter5(noisy_img)
    [m,n] = size(noisy_img);
    filtered_img = uint8(zeros(m,n));
    for i = 3:m-2
        for j = 3:n-2
            flt =[noisy_img(i-2,j+2),noisy_img(i-1,j+2),noisy_img(i,j+2),noisy_img(i+1,j+2),noisy_img(i+2,j+2),noisy_img(i+2,j+1),noisy_img(i+2,j),noisy_img(i+2,j-1),noisy_img(i+2,j-2),noisy_img(i+1,j-2),noisy_img(i,j-2),noisy_img(i-1,j-2),noisy_img(i-2,j+2),noisy_img(i-2,j-2),noisy_img(i-2,j),noisy_img(i-2,j+1),noisy_img(i-2,j-1),noisy_img(i-1,j-1),noisy_img(i-1,j),noisy_img(i-1,j+1),noisy_img(i,j-1),noisy_img(i,j),noisy_img(i,j+1),noisy_img(i+1,j-1),noisy_img(i+1,j),noisy_img(i+1,j+1)];
            filtered_img(i,j) = mean(flt);
        end
    end
end

function filtered_img = MedianFilter(noisy_img)
    [m,n] = size(noisy_img);
    filtered_img = uint8(zeros(m,n));
   % M = [1 2 2; 1 1 1; 2 1 1]/12;
    
    for i = 2:m-1
        for j = 2:n-1
            flt =[noisy_img(i-1,j-1) 2*noisy_img(i-1,j) 2*noisy_img(i-1,j+1)...
                noisy_img(i,j-1) noisy_img(i,j) noisy_img(i,j+1) ...
                2*noisy_img(i+1,j-1) noisy_img(i+1,j) noisy_img(i+1,j+1)];
            filtered_img(i,j) = median(flt);
        end
    end
end

function filtered_img = MedianFilter5(noisy_img)
    [m,n] = size(noisy_img);
    filtered_img = uint8(zeros(m,n));
    for i = 3:m-2
        for j = 3:n-2
            flt =[noisy_img(i-2,j+2),noisy_img(i-1,j+2),noisy_img(i,j+2),noisy_img(i+1,j+2),noisy_img(i+2,j+2),noisy_img(i+2,j+1),noisy_img(i+2,j),noisy_img(i+2,j-1),noisy_img(i+2,j-2),noisy_img(i+1,j-2),noisy_img(i,j-2),noisy_img(i-1,j-2),noisy_img(i-2,j+2),noisy_img(i-2,j-2),noisy_img(i-2,j),noisy_img(i-2,j+1),noisy_img(i-2,j-1),noisy_img(i-1,j-1),noisy_img(i-1,j),noisy_img(i-1,j+1),noisy_img(i,j-1),noisy_img(i,j),noisy_img(i,j+1),noisy_img(i+1,j-1),noisy_img(i+1,j),noisy_img(i+1,j+1)];
            filtered_img(i,j) = median(flt);
        end
    end
end



