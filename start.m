clear all; clc;
addpath('./utility');
load('dettagli_auto');
    
%% Definizione delle costanti del sistema
% Calcolo del plant
[plant,M,N] = createPlant(b,ca,ka,cp,kp,m,I);

% Calcolo dei pesi
[W1,W2,W3] = getHWeights();

% Calcolo del sistema aumentato
plant_aug = createPlantAugmented(plant);

% Proprietà del sistema
structuralProperty(plant,plant_aug);

%% Controllo PP
[int_pp,obs_pp] = controllore_pp();

%% Controllore LQG
[int_lqg,obs_lqg] = controllore_lqg();

%% Controllore H infinito
figure(2);
[Khinf] = controllore_hinf();