function [Q,R] = getLQWeights(x_max,v_max,theta_max,omega_max,u_max)
% Calcolo della matrice di peso Q
Q11 = 1 * 1/(x_max^2);
Q22 = 1 * 1/(v_max^2);
Q33 = 1 * 1/(theta_max^2);
Q44 = 1 * 1/(omega_max^2);
Q55 = 1;
Q66 = 1;
Q = diag([Q11 Q22 Q33 Q44 Q55 Q66]);

% Calcolo della matrice di peso R
R11 = 1 * 1/(u_max^2);
R22 = 1 * 1/(u_max^2);
R = diag([R11 R22]);
end