function [W1,W2,W3] = getHWeights()
% Definizione costanti dei pesi
alpha = 0.1;
beta = 0.1;
w1 = 10^-1;
w2 = 10^3;
w3 = 10^5;

% Definizione pesi
s = zpk('s');

%{
W1 = (1/alpha) * 1/((s/w1)+1); W1 = [W1 0; 0 W1];
W2= 1 * 10^-6; W2 = [W2 0; 0 W2];
W3 = beta *(((s/w2)+1)/((s/w3)+1)); W3 = [W3 0; 0 W3];
%}

W1_temp = (1/alpha) * 1/((s/w1)+1); W1 = append(W1_temp,W1_temp);
W2_temp = 1 * 10^-6; W2 = diag([W2_temp W2_temp]);
W3_temp = beta *(((s/w2)+1)/((s/w3)+1)); W3 = append(W3_temp,W3_temp);
end