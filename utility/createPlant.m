function [plant,M,N] = createPlant(b,ca,ka,cp,kp,m,I)

A = zeros(4,4);
A(1,2) = 1;
A(2,1) = -(ka+kp)/m;
A(2,2) = -(ca+cp)/m;
A(2,3) = (kp-ka)*(b/m);
A(3,4) = 1;
A(4,1) = (ka-kp)*(b/I);
A(4,2) = (ca-cp)*(b/I);
A(4,3) = (ka+kp)*(b^2)/I;

B = zeros(4,2);
B(2,1) = 1/m;
B(2,2) = 1/m;
B(4,1) = -(b/I);
B(4,2) = (b/I);

C = zeros(2,4);
C(1,1) = 1;
C(1,3) = b;
C(2,1) = 1;
C(2,3) = -b;

D = zeros(2,2);

M = zeros(4,4);
M(2,1) = ka/m;
M(2,2) = kp/m;
M(2,3) = ca*b/m;
M(2,4) = cp*b/m;
M(4,1) = -ka*(b/I);
M(4,2) = kp*(b/I);
M(4,3) = -ca * b * (b/I);
M(4,4) = -cp * b * (b/I);

N = zeros(2,4);

plant = ss(A,B,C,D);
plant.StateName = {'x','v','theta','omega'};
plant.InputName = {'Fa','Fp'};
plant.OutputName = {'xa','xp'};
end