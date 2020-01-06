function PV = discount(y, n, C, obj, Face)
% BondPrice is the present value
% y is the interest rate
% n is the number of periods
% C is the coupon unit
% obj is the predicted inflation

CF = C.*obj; % Coupon times infaltion adjusting factor
CF(n) = CF(n) + Face; % Last period = Coupon + Face
value = 0; % Initialize the value
d = 1 + y/12; % Discount Factor

for i = n:-1:1
    value = (value + CF(i)) / d(i);
end
PV = value;

end
% test : discount(0.15, 12, 50, infl_pred, 1000) 
