function plant_tot = createTotalPlant(plant,Ki,Ko,L)

A = plant.A;
B = plant.B;
C = plant.C;
D = plant.D;

At = [(A-B*Ko) -(A-B*Ko-L*C) B*Ki;
    zeros(4,4) A-L*C zeros(4,2);
    -(C-D*Ko) D*Ko -D*Ki];
Bt = [zeros(4,2); zeros(4,2); eye(2,2)];
Ct = [(C-D*Ko) D*Ko D*Ki];
Dt = zeros(2,2);

plant_tot = ss(At,Bt,Ct,Dt);
end