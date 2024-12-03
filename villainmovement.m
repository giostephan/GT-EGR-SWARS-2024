function [ villainTargetPos, villainPos ] = villainmovement(villainTargetPos, villainPos)
% villainmovement is a function that moves the player 2 ship
% Input Arguments :
% villainTargetPos - location of click
% villainPos - location of player 2
% Output Arugments :
% villainPos - updated player 2 position
% villainTargetPos - location of player 2 ship for player 1
direction = villainTargetPos - villainPos;
villainDistance = norm(direction);
if villainDistance > 1
    direction = direction / villainDistance;
    speed = min(7, villainDistance * 0.1); % Adjust hero speed here
    villainPos = villainPos + speed * direction; % Updating Villain position
else
    villainTargetPos = villainPos;  % Reset villain target to current position
end