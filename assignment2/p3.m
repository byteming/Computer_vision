%p3
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