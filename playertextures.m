function playertextures(ship,ship2)
% player textures is a function that changes the appearance of a given ship
% Input Arguments :
%  ship - player 1 ship
%  ship2 - player 2 ships
% Output Arguments : N/A

   
            set(ship.patch,'EdgeColor', randi(10,1,3)/10);
            set(ship2.patch,'EdgeColor', randi(10,1,3)/10);
  