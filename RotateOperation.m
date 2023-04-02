function rotated_img=RotateOperation(img,angle)
angle=deg2rad(angle);
[m,n,~]=size(img);

cos_theta=cos(angle);
sin_theta=sin(angle);

rotated_img=img;
rotated_img(:,:)=0;
for i=1:m
    for j=1:n
        x=ceil(i*cos_theta - j*sin_theta);
        y=ceil(i*sin_theta + j*cos_theta);
        if x<1 || y<1
            continue
        elseif x>m && y<=n
            rotated_img(m,y,:)=img(i,j,:);
        elseif x<=m && y>n
            rotated_img(x,n,:)=img(i,j,:);
        elseif x>m && y>n
            rotated_img(m,n,:)=img(i,j,:);
        else
            rotated_img(x,y,:)=img(i,j,:);
        end
    end
end