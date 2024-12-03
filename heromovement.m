function [ heroPos, heroTargetPos ] = heromovement( heroTargetPos, heroPos )
% heromovement is a function that moves player 1 ship
% Input Arguments:
% heroTargetPos - where the ship is to be moved
% heroPos - location of the ship
% Output Arguments :
% heroPos - updated position
% heroTargetPos - tells player 2 where the new pos of hero is
direction = heroTargetPos - heroPos;
heroDistance = norm(direction);
if heroDistance > 1
    direction = direction / heroDistance;
    speed = min(7, heroDistance * 0.1); % Adjust hero speed here
    heroPos = heroPos + speed * direction; % Updating hero position
else
    heroTargetPos = heroPos; % Reset hero target to current position
end