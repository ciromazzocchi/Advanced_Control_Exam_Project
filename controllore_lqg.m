function [integrator,observer] = controllore_lqg()
addpath('./utility');
load('dettagli_auto');
    
%% Definizione delle costanti del sistema
% Calcolo del plant
[plant,M,N] = createPlant(b,ca,ka,cp,kp,m,I);

% Calcolo del sistema aumentato
plant_aug = createPlantAugmented(plant);

%% Propriet� del sistema
structuralProperty(plant,plant_aug);

%% LQ
[Q,R] = getLQWeights(x_max,v_max,theta_max,omega_max,u_max);

% Calcolo della retroazione di uscita
a = 5/Ta;
K = lqr(plant_aug.A+a*eye(6,6),plant_aug.B,Q,R);
Kobs = K(:,1:4);
Ki = K(:,5:6);

% Definizione dell'integratore discreto
Int = ss(zeros(2,2),eye(2,2),Ki * eye(2,2),zeros(2,2));
integrator = c2d(Int,Ts,'tustin');

%% Osservatore di stato
%[Qs,Rs] = getLQGWeights();
[Qs,Rs] = getLQGWeights();

% Calcolo delle matrici di stato dell'osservatore
[obs,L,~] = kalman(ss(plant.A,[plant.B M],plant.C,[plant.D N]),Qs,Rs);
Aobs = obs.A;
Bobs = obs.B;
Cobs = obs.C(3:6,:);
Dobs = obs.D(3:6,:);
obs = ss(Aobs,Bobs,Cobs,Dobs);

% Definizione dell'osservatore discreto
obsd = ss(obs.A, obs.B, Kobs * obs.C, Kobs * obs.D);
observer = c2d(obsd,Ts,'tustin');
end
