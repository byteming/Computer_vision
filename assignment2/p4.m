%p4
OriImg= imread('/Users/mingmingqiu/Desktop/CS 631T Computer Vision/week2/City.jpg');
se = strel('square',3);
A = imdilate(OriImg,se);
B = imerode(OriImg,se);
C = A - B;
figure,imshow(B),title('P4');
disp('Discuss: The image A is a enlarge feature of original photo, The image B is a shrink feature photo, let C = A-B, which means an outline of feature was cut out. So, In the picture C, black part is the same part of A and B. White/Gray part is outline of feature.');