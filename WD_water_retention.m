function [obj_mass,icef,waterf,obj_mass_loss]=WD_water_retention(Distance,Radius,Formation,Composition,StarMass)
% WD_water_retention - calculates ice and water retention in minor planets
% around host variuos of various masses

% INPUT variables:
% * Distance - the initial orbital distance of the minor planet in units of
% au, within the range [3-400]
% * Radius - the initial radius of the minor planets in units of km, within
% the range [1-600]
% * Formation - the time it took the minor planet to form past the 
% formation of calcium-aluminom inclusions (CAI) in the young 
% protoplanetary disc, in units of Myr, within the range [3-10]
% * Composition - the initial rock to ice mass ratio, between [1-3]

% OUTPUT cariables:
% * obj_mass - the interpolated mass of the minor planet for a given radius
% * icef - the fraction of remaining ice mass at the end of the evolution 
% to the initial ice mass at the beginning of the evolution.
% * waterf - the fraction of remaining water mass (including water in 
% hydrated rocks) at the end of the evolution to the initial water mass at
% the beginning of the evolution.
% obj_mass_loss - the fraction of mass lost due to loss of water 

% The matrices ICE.mat and WATER.mat provide the ice and water retention
% values respectively, at regularly spaced grid points along the full
% parameter space. These matrices are used for interpolation, and are
% derived from the results obtained by Malamud&Perets (2017a,2017b). If
% used, please 

temp=load('ICE.mat');
ICE=temp.ICE;
temp=load('WATER.mat');
WATER=temp.WATER;
    
Dn=[3 5 7 10 12 20 30 40 75 100 125 150 175 200 225 250 275 300 325 400];
Rn=[1 5 25 50 100 270 600];
Fn=[3 4 5 10];
Cn=[1 2 3];
Mn=[1 2 3 3.6 5 6.4];
[f1,f2,f3,f4,f5]=ndgrid(Dn,Rn,Fn,Cn,Mn);

obj_mass=interpn([1 5 25 50 100 270 600],[4.189e15 5.236e17 6.545e19 5.236e20 4.189e21 1.072e23 1.538e24],Radius);
icef=interpn(f1,f2,f3,f4,f5,ICE,Distance,Radius,Formation,Composition,StarMass);
waterf=interpn(f1,f2,f3,f4,f5,WATER,Distance,Radius,Formation,Composition,StarMass);
obj_mass_loss=(1-waterf)/(1+Composition);

