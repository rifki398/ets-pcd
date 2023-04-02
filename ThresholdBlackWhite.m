function img=ThresholdBlackWhite(img,thres)
[m,n,o]=size(img);
if o~=1
    disp('Your image changed to Grayscale');
    img=rgb2gray(img);
end
for i=1:m
    for j=1:n
        if img(i,j)>thres
            img(i,j)=255;
        else
            img(i,j)=0;
        end
    end
end