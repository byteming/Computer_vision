function img_output =ReduceGrayScale(img_input)
imgsize = size(img_input);
img_output = uint8(zeros(imgsize(1),imgsize(2)));

 for r = 1:1:imgsize(1)
    for c = 1:1:imgsize(2)
        img_output(r,c)= fix(double(img_input(r,c))/4);
    end
 end
