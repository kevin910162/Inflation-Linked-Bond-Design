function assetpath = r_generator(a,b,r0,sigma,step,NumPath)

r = zeros(NumPath,step+1);
r(:,1) = r0;

for i=1:NumPath
    for j=1:step
        brownian = randn(1);
        r(i,j+1) = r(i,j) + a*(b-r(i,j)) + sigma*brownian;
    end
end

assetpath = r(:,2:step+1); % Remove the initial interest rate
end

% a=0.1,b=0.015,r0=0.015,sigma=0.001,step=360
% test : r_generator(0.1,0.015,0.015,0.001,360,10)