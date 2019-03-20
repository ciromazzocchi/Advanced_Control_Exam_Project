function obs = createObserver(plant,L)
% Calcolo del sistema
Aobs = plant.A-(L*plant.C);
Bobs = [plant.B-(L*plant.D) L];
Cobs = eye(4,4);
Dobs = zeros(4,4);
obs = ss(Aobs,Bobs,Cobs,Dobs);
end