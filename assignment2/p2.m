%problem 2
OriImg= imread('/Users/mingmingqiu/Desktop/CS 631T Computer Vision/week2/shapes.tiff');
se = strel('square',20);
se1 = strel('square',36);

BErodeImg=imerode(OriImg,se);
BImg = imdilate(BErodeImg,se);
subplot(2,2,1),imshow(OriImg),title('(a)Original image');
subplot(2,2,2),imshow(BImg), title('(b)The desired image1');

CDiateImg = imdilate(OriImg,se);
CImg = imerode(CDiateImg,se);
subplot(2,2,3),imshow(CImg), title('(c)The desired image2');

DImg = imerode(dialate,se);
D1Img = imdilate(DImg,se1);
D2Img = imerode(D1Img,se);
subplot(2,2,4),imshow(D1Img), title('(D)The desired image3');