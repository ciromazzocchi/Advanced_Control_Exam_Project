function [integrator,observer] = controllore_pp()
addpath('./utility');
load('dettagli_auto');
    
%% Definizione delle costanti del sistema
% Calcolo del plant
[plant,M,N] = createPlant(b,ca,ka,cp,kp,m,I);

% Calcolo del sistema aumentato
plant_aug = createPlantAugmented(plant);

%% Pole placement
% Calcolo del coefficiente di retroazione di stato
K = place(plant_aug.A,plant_aug.B,[-5.1 -5.2 -5.3 -5.4 -5.5 -5.6]);
Kobs = K(:,1:4);
Ki = K(:,5:6);

%% Osservatore di stato
% Calcolo delle matrici di stato dell'osservatore
L = place(plant.A',plant.C',[-50.1 -50.2 -50.3 -50.4])';

% Calcolo del sistema
obs = createObserver(plant,L);

%% Calcolo delle matrici discrete
% Definizione dell'integratore discreto
integrator = ss(zeros(2,2),eye(2,2),Ki * eye(2,2),zeros(2,2));
integrator = c2d(integrator,Ts,'tustin');

% Definizione dell'osservatore discreto
observer = ss(obs.A, obs.B, Kobs * obs.C, Kobs * obs.D);
observer = c2d(observer,Ts,'tustin');
end