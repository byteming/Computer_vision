rgb = imread('/Users/mingmingqiu/Desktop/CS 631T Computer Vision/week5/ball.bmp');
%imshow(rgb);
% Igray = rgb2gray(rgb);
% [counts,x] = imhist(Igray,100);
% stem(x,counts)
% T = otsuthresh(counts);
% BW = imbinarize(Igray,T);
% figure;imshow(BW)
% %find radii
% d = imdistline;
% delete(d);
% [centers,radii] = imfindcircles(rgb,[30 60],'Sensitivity',0.97)
% imshow(rgb)
% h = viscircles(centers,radii)

%open
% se = strel('sphere',55);
% ImgOpen = imopen(gpuArray(Igray),se);
% imshow(ImgOpen)

for i = 1:400
    for j = 1:600
        if((rgb(i,j,1)>130&rgb(i,j,2) <100 & rgb(i,j,3)<100) == 0)
            rgb(i,j,1)=0;
            rgb(i,j,2) = 0;
            rgb(i,j,3) =0;
        end
    end
end
figure(2);imshow(rgb);
SE = strel('sphere',1);
f3 = imdilate(rgb,SE);
figure(3);imshow(f3);

s = regionprops(f3,'centroid');
centroids = cat(1,s.Centroid);
imshow(f3)
hold on
plot(centroids(:,1),centroids(:,2),'b*')
hold off
imtool(rgb);
centroid =[380,290];
centroid;
