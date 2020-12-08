clear all; close all; clc;

%ITRF96 Datumu GRS80 Elipsoidi Parametreleri
a = 6378137.000; %metre cinsinde
f = 1 / 298.2572221008827;
b = 6356752.314140; %metre cinsinde
c = 6399593.625864; %metre cinsinde
e_kare = 0.006694380022903430;
e_ussu_kare = 0.006739496775481640; 
A_ussu = 111132.952547; %metre cinsinde
B_2_ussu = 0.144318133; 
C_2_ussu = 0.000212049; 
D_2_ussu = 0.000000427; 
% G değerini isteme
%G = input("G değerini giriniz: ");
G = 4314212.496; %metre cinsinde

%sigma değeri hesabı
sigma = G / A_ussu;
fprintf('σ: %.13f', sigma);
sigma_radyan = (pi * sigma) / 180;
sigma_derece_dakika_saniye = degrees2dms(sigma);
fprintf(' => %2.0f:%2.0f:%7.4f\n', sigma_derece_dakika_saniye);

%B_2_ussu_sin_2_sigma hesabı
B_2_ussu_sin_2_sigma = B_2_ussu * sin(2* sigma_radyan);
fprintf('B"Sin2σ: %.13f', B_2_ussu_sin_2_sigma);
B_2_ussu_sin_6_sigma_derece = degrees2dms(B_2_ussu_sin_2_sigma);
fprintf(' => %2.0f:%2.0f:%7.4f\n', B_2_ussu_sin_6_sigma_derece);

%C_2_ussu_sin_4_sigma hesabı
C_2_ussu_sin_4_sigma = C_2_ussu * sin(4 * sigma_radyan);
fprintf('C"Sin4σ: %.13f', C_2_ussu_sin_4_sigma);
C_2_ussu_sin_6_sigma_derece = degrees2dms(C_2_ussu_sin_4_sigma);
fprintf(' => %2.0f:%2.0f:%7.4f\n', C_2_ussu_sin_6_sigma_derece);

%D_2_ussu_sin_6_sigma hesabı
D_2_ussu_sin_6_sigma = D_2_ussu * sin(6 * sigma_radyan);
fprintf('D"Sin6σ: %.13f', D_2_ussu_sin_6_sigma);
D_2_ussu_sin_6_sigma_derece = degrees2dms(D_2_ussu_sin_6_sigma);
fprintf(' => %2.0f:%2.0f:%7.4f\n', D_2_ussu_sin_6_sigma_derece);

%B hesabı
B = sigma + B_2_ussu_sin_2_sigma + C_2_ussu_sin_4_sigma + D_2_ussu_sin_6_sigma;
fprintf('B: %.13f', B);
B_derece_dakika_saniye = degrees2dms(B);
fprintf(' => %2.0f:%2.0f:%7.4f\n', B_derece_dakika_saniye);


