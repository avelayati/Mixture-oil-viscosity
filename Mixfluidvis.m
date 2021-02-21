close 
clc
clear
%% commonly used in petroleum refining for predicting the viscosity of oil blends
%inputs
Uda = 6.5; %  Dynamic viscosity of oil A; cp(mPa.s)
Udb = 0.2; % Dynamic viscosity of oil B; cp(mPa.s)
Xa = 0.9 ; % Volumetric fraction of oil a
Xb = 1-Xa ; % Volumetric fraction of oil b
rhoa = 0.85 ; %Density of the oil a; g/cm3
rhob = 0.6 ; %Density of the oil b; g/cm3
Vtotal = 12; %Total volume of the mixture fluid; cm3

% conversions
Vtotal = Vtotal/(10^6); %Total volume of the mixture fluid; m3
Uda = Uda ./ 1000; % Dynamic viscosity;Pa.s
Udb = Udb ./ 1000; % Dynamic viscosity;Pa.s
rhoa = rhoa*1000 ; %Density of the oil a; kg/m3
rhob = rhob*1000 ; %Density of the oil b; g/m3
vola = Xa*Vtotal ; %m3 of the oil a
volb = Xb*Vtotal ; %m3 of the oil b

%% Kinematic viscosity   [ u (m2/s) = Ud (Pa.s) / rho (Kg/m3) ] 
ua = Uda ./ rhoa ; %Kinematic viscosity of the oil a (m2/s)
ub = Udb ./ rhob ; %Kinematic viscosity of the oil a (m2/s)
SigM = rhoa*vola + rhob*volb ; % total mass of the oils
rhomix = SigM/Vtotal ;%fluid mix total density kg/m3
%% GAMBILL METHOD  [ umix ^1/3 = xa*ua^1/3 + xb*ub^1/3 ]
%Gambill (1959) proposed the following equation for... 
...estimating the kinematic viscosity of a two liquid mixture.
umix = power(Xa.*(ua.^(1/3)) + Xb.*(ub.^(1/3)),3); % mixture kinematic vis (m2/sec)
Umix = umix * rhomix* 1000 % Dynamic viscosity of fluid mixture (cp)
disp (['Dynamic viscosity of the fluid mixture containing  ' num2str(Xa) ' OilA and '...
     num2str(Xb) ' OilB is: ' num2str(Umix)])
