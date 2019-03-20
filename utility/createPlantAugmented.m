function plant_aug = createPlantAugmented(plant)

Ac = [plant.A zeros(4,2); -plant.C zeros(2,2)];
Bc = [plant.B; zeros(2,2)];
Cc = [plant.C zeros(2,2)];
Dc = zeros(2,2);
plant_aug = ss(Ac,Bc,Cc,Dc);

end