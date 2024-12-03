function [heroTorpedoPos] = heroshoot(heroPos,heroshootPos,torpedo_1)
% heroshoot is the shooting function for player 1 ship
% Input Arguments:
% heroPos - player 1 position
% heroshootPos - player 1 shooting position
% torpedo_1 - torpedo figure
% Output Arguments :
% heroTorpedoPos - position of the torpedo in the current array
global heroTorpedoPos torpedoDirection

if isempty(heroTorpedoPos)
    heroTorpedoPos = heroPos;  % Set initial position of the torpedo to the hero's position
    direction = heroshootPos - heroPos ;
    torpedoDirection = direction/norm(direction);  % Calculate direction towards the target
end

heroTorpedoPos = heroTorpedoPos + 10 * torpedoDirection;

draw_torpedos(heroTorpedoPos, torpedo_1);
end