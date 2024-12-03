function [villainTorpedoPos] = villainshoot(villainPos,villainshootPos,torpedo_2)
% villainshoot is a function that displays the array of the player 2
% torpedo
% Input Arguments :
% villainPos - location of villain
% villainshootPos - location of click
% torpedo2 - torpedo position in given array
% Output Arugments - updated torpedo position
global villainTorpedoPos torpedoDirection

if isempty(villainTorpedoPos)
    villainTorpedoPos = villainPos;  % Set initial position of the torpedo to the villain's position
    direction = villainshootPos - villainPos ;
    torpedoDirection = direction/norm(direction);  % Calculate direction towards the target
end

villainTorpedoPos = villainTorpedoPos + 10 * torpedoDirection;

draw_torpedos(villainTorpedoPos, torpedo_2);
end