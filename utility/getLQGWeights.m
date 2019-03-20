function [Q,R] = getLQGWeights()
% Calcolo della matrice di covarianza Q
Q11 = 1 * 10^4;
Q22 = 1 * 10^4;
Q33 = 1 * 10^4;
Q44 = 1 * 10^4;
Q = diag([Q11 Q22 Q33 Q44]);

% Calcolo della matrice di covarianza
R11 = 1*10^2;
R22 = 1*10^2;
R = diag([R11 R22]);
end