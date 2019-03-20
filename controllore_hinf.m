function [Khinf] = controllore_hinf()
addpath('./utility');
load('dettagli_auto');
    
%% Definizione del plant
[plant,M,N] = createPlant(b,ca,ka,cp,kp,m,I);

%% Definizione delle funzioni di trasferimento
G = plant;
[W1,W2,W3] = getHWeights();
P = augw(G,W1,W2,W3);

nmeas = 2;
ncont = 2;
gamTry = 1;
opts = hinfsynOptions('Display','on');
[Khinf,CL,gamma] = hinfsyn(P,nmeas,ncont,gamTry,opts);

L = G*Khinf; 
S = inv(eye(2)+L); 
T = eye(2)-S; 

sigma(S,'k',T,'r',L,'g')
legend('S = 1/(1+L)','T=L/(1+L)','L')

Khinf = c2d(Khinf,Ts,'tustin');
end