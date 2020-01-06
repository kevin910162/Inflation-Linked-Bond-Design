%%% Params Settings
a = 0.1;
b = 0.015;
r0 = 0.015;
sigma =0.001;
step = 360;
path = 1000;
coupon = 20;

% Generate discount rate by Vasicek Model & Monte Carlo
assetpath = r_generator(a,b,r0,sigma,step,path);

% Select 12 value from every simulation
disc_rate = assetpath(:,[30,60,90,120,150,180,210,240,270,300,330,360]); 

% Calculate Infaltion-Linked Bond Price

Price = zeros(path,1);
for i=1:path
    Price(i) = discount( disc_rate(i,:), 12, coupon, infl_pred, 1000);
end
BondPrice = mean(Price)