close all;
clear;
clc;

img=imread('peppers.png');

% Konversi gambar
img_gray=rgb2gray(img);
img_red=img(:,:,1);
img_green=img(:,:,2);
img_blue=img(:,:,3);

% Paramater
angle=15; % sudut untuk soal rotasi
T1=60; T2=120; T3=160; % threshold untuk soal threshold
K=[-1 -1 -1; % matriks kernel untuk soal konvolusi
    -1 8 -1;
    -1 -1 -1];
SE=offsetstrel('ball',4,4); % Structuring element untuk soal morfologi

disp('-------------------------- ETS PCD --------------------------');
disp('Moh Rifqy R | 01111940000028');
disp('Ketik nomor untuk melihat hasil penyelsaian soal');
disp(['1: soal nomor 1';
      '2: soal nomor 2';
      '3: soal nomor 3';
      '4: soal nomor 4';
      '5: soal nomor 5'])
option=input('Masukkan nomor soal: ');

switch option
    case 1
        soalNo1(img,angle);
    case 2
        soalNo2(img_gray,T1,T2,T3);
    case 3
        soalNo3(img_gray, img_red, img_green, img_blue);
    case 4
        soalNo4(img_gray,K);
    case 5
        soalNo5(img_gray,SE)
    otherwise
        error('Masukkan opsi yang tepat!');
end

% ========================= Bagian Function Tiap Soal =====================
% SOAL NOMOR 1 - Rotasi
function soalNo1(img,angle)
img_center=imrotate(img,angle,'bilinear','crop'); %Berdasarkan titik tengah
img_lefttop=RotateOperation(img,angle); %Berdasarkan titik kiri-atas
subplot(1,2,1), imshow(img_center);
title(['Rotasi ',num2str(angle),' dengan sumbu di tengah']);
subplot(1,2,2), imshow(img_lefttop);
title(['Rotasi ',num2str(angle),' dengan sumbu di kiri-atas']);
end

% SOAL NOMOR 2 - Penerapan Threshold
function soalNo2(img_gray,T1,T2,T3)
img_T1=ThresholdBlackWhite(img_gray,T1);
img_T2=ThresholdBlackWhite(img_gray,T2);
img_T3=ThresholdBlackWhite(img_gray,T3);
subplot(2,2,1), imshow(img_gray);
title('Gambar tanpa threshold');
subplot(2,2,2), imshow(img_T1);
title(['Gambar dengan threshold:  ',num2str(T1)]);
subplot(2,2,3), imshow(img_T2);
title(['Gambar dengan threshold:  ',num2str(T2)]);
subplot(2,2,4), imshow(img_T3);
title(['Gambar dengan threshold:  ',num2str(T3)]);
end

% SOAL NOMOR 3 - Histogram
function soalNo3(img_gray, img_red, img_green, img_blue)
subplot(2,2,1), imhist(img_gray);
title('Histogram gambar grayscale');
subplot(2,2,2), imhist(img_red);
title('Histogram gambar RGB komponen red');
subplot(2,2,3), imhist(img_green);
title('Histogram gambar RGB komponen green');
subplot(2,2,4), imhist(img_blue);
title('Histogram gambar RGB komponen blue');
end

% SOAL NOMOR 4 - Konvolusi
function soalNo4(img_gray,K)
img_conv=conv2(img_gray,K);
subplot(1,2,1), imshow(img_gray);
title('Sebelum Konvolusi');
subplot(1,2,2), imshow(img_conv);
title('Sesudah Konvolusi');
end

% SOAL NOMOR 5 - Morfologi
function soalNo5(img_gray,SE)
img_rode=imerode(img_gray,SE);
img_dil=imdilate(img_gray,SE);
img_op=imdilate(img_rode,SE);
img_cl=imerode(img_dil,SE);
subplot(1,3,1), imshow(img_gray);
title('Gambar asli');
subplot(1,3,2), imshow(img_op);
title('Operasi opening');
subplot(1,3,3), imshow(img_cl);
title('Operasi closing');
end

