function defineCostant()

%% Parametri dell-auto
b = 1.5;            % Distanza dal baricentro
ca = 1.5 * 10^3;    % Coefficiente di smorzatore ammortizzatore posteriore
ka = 50 * 10^3;     % Coefficiente di elasticità ammortizzatore anteriore
cp = 1.6 * 10^3;    % Coefficiente di smorzamento ammortizzatore posteriore
kp = 48 * 10^3;     % Coefficiente di elasticità ammortizzatore posteriore
m = 1600;           % Massa dell'auto
I = 24225;          % Momento d'inerzia dell'auto
lk = 1.125;         % Lunghezza a riposo degli ammortizzatori
g = 9.8;            % Accelerazione di gravità

%% Parametri dell'attuatore
u_max = 10^4;
x_max = 100 * 10^-3;
v_max = 1;
theta_max = 5 * (pi/180);
omega_max = 1;

x0 = [lk,0,0,0];
%dx = [0.05,0,1*pi/180,0];
%x0 = x0 + dx;

%% Parametri del controllo
Ta = 3;
Ts = 0.01;

%% Parametri dei disturbi
noise_x = 25*10^-4;
noise_y = [10^-6, 10^-6];

%% Salvataggio dati
save('../dettagli_auto');
disp('Dati aggiornati');
end