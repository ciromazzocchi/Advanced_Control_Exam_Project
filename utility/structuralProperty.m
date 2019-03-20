function structuralProperty(plant,plant_aug)

disp('Autovalori del sistema:');
disp(eig(plant));
disp('Rank della matrice di controllabilità del sistema');
disp(rank(ctrb(plant)));
disp('Rank della matrice di osservabilità del sistema');
disp(rank(obsv(plant)));
disp('Rank della matrice di controllabilità del sistema aumentato');
disp(rank(ctrb(plant_aug)));
disp('Rank della matrice di osservabilità del sistema aumentato');
disp(rank(obsv(plant_aug)));

end