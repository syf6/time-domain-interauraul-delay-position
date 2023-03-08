clc;clear;close all
%Load each signals in MATLAB with audioread
%y is a 2 dimentional matrix of the audio value, and the Fs is the sampling
%rate
[y1,Fs1] = audioread('td1.wav');
[y2,Fs2] = audioread('td2.wav');
[y3,Fs3] = audioread('td3.wav');
[y4,Fs4] = audioread('td4.wav');
[y5,Fs5] = audioread('td5.wav');

% normalize the matrix along its first dimention : line
%
n1 = normalize(y1,1);
n2 = normalize(y2,1); 
n3 = normalize(y3,1);
n4 = normalize(y4,1);
n5 = normalize(y5,1);

%do the cross correlation between the 2 channels in one matrix
%r1 = xcorr (n1(:,1),n1(:,2));
[r1,lags1] = xcorr (n1(:,1),n1(:,2));
[r2,lags2] = xcorr (n2(:,1),n2(:,2));
[r3,lags3] = xcorr (n3(:,1),n3(:,2));
[r4,lags4] = xcorr (n4(:,1),n4(:,2));
[r5,lags5] = xcorr (n5(:,1),n5(:,2));

%Estimate the relation between angle and time delay

% Determine distance between microphones
d = 0.2; % in meters

[v1,i1]=max(r1);
maxLag1=lags1(i1);
deg1=90 - acosd((maxLag1/Fs1)/(d/340));

% Convert time delay to angle, time difference of arrival
% TDOA = abs(maxLag1) / Fs1;
% angle = asin(TDOA / d);

% Display result
fprintf('The angle of audio 1 is %f degrees\n', deg1);

[v2,i2]=max(r2);
maxLag2=lags1(i2);
% deg2=acos(1700*maxLag2);
deg2=90 - acosd((maxLag2/Fs2)/(d/340));
fprintf('The angle of audio 2 is %f degrees\n', deg2);

[v3,i3]=max(r3);
maxLag3=lags1(i3);
deg3=90 - acosd((maxLag3/Fs3)/(d/340));
fprintf('The angle of audio 3 is %f degrees\n', deg3);

[v4,i4]=max(r4);
maxLag4=lags1(i4);
deg4=90 - acosd((maxLag4/Fs4)/(d/340));
fprintf('The angle of audio 4 is %f degrees\n', deg4);

[v5,i5]=max(r5);
maxLag5=lags1(i5);
deg5=90 - acosd((maxLag5/Fs5)/(d/340));
fprintf('The angle of audio 5 is %f degrees\n', deg5);

% n1l = normalize(y1'(1,:));
% n1r = normalize(y1'(2,:));

% figure;
% plot(y1);

figure;
subplot(5,1,1);
plot(lags1,r1);
subplot(5,1,2);
plot(lags2,r2);
subplot(5,1,3);
plot(lags3,r3);
subplot(5,1,4);
plot(lags4,r4);
subplot(5,1,5);
plot(lags5,r5);