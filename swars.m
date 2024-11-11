function  swars(player)
% swars the ultimate space shooter game
% Input Arguments  |
%   * player - may select a player by using swars(playerNumber)
%   * playerNumber - can be 1 or 2
% Output Arguments |
%      * Extreme Dopamine Rush
% 
% - - - *| G A M E  C O N T R O L S | * - - -

% Multiplayer setup
i = 0;
WIRELESSPLAY = input('WIRELESS PLAY? [Y] | [N]','s');
    if upper(WIRELESSPLAY(1)) == 'Y'
        HOST = input('ARE YOU HOSTING [Y] | [N]','s');
        if upper(HOST(1)) =='Y'
            player1 = tcpserver('192.168.12.203', 42056); % Enter hosting IP here
        end
        if upper(HOST(1)) == 'N'
        player1 = tcpclient('0.0.0.0', 42056);
        end
    end

global mainAxis;

playerNumber = player;

% Call/set global variables
global heroPos villainPos heroTargetPos villainTargetPos right_button quitGame;  %#ok<GVMIS>
right_button = false;
quitGame = false;

% Initialize graphics
[mainAxis, ship, ship2, axisTitle, heroPos, villainPos] = initialize_graphics();
if playerNumber == 1
    print_title(axisTitle,'S W A R S PLAYER 1') % Set player 1 window title
elseif playerNumber == 2
    print_title(axisTitle,'S W A R S PLAYER 2') % Set plater 2 window title
end

heroPos = [50, 150]; % Hero starting position
villainPos = [150, 150]; % Villain starting position

% *This part needs to be reworked
figHandle = gcf;
set(figHandle, 'KeyPressFcn', @keyDownListener, 'WindowButtonUpFcn', @mouseUpListener, 'WindowButtonMotionFcn', @mouseMoveListener);
set(mainAxis, 'ButtonDownFcn', @mouseDownListener);

% Movement
    while ~quitGame
        pause(0.015);
        % Hero movement
        if playerNumber == 1
            if ~isempty(heroTargetPos)
                direction = heroTargetPos - heroPos;
                heroDistance = norm(direction);
                if heroDistance > 1
                    direction = direction / heroDistance;
                    speed = min(7, heroDistance * 0.1); % Adjust hero speed here
                    heroPos = heroPos + speed * direction; % Updating hero position
                else
                    heroTargetPos = heroPos; % Reset hero target to current position
                end
            end

            % Write heroPos to 'player1.xlsx'
            fid = fopen('player1.xlsx', 'w');
            fprintf(fid, '%f %f\n', heroPos);
            fclose(fid);

            % Read villainPos from 'player2.xlsx' if it exists
            if exist('player2.xlsx', 'file')
                fid = fopen('player2.xlsx', 'r');
                villainPosRead = fscanf(fid, '%f %f');
                fclose(fid);
                if numel(villainPosRead) == 2
                    villainPos = villainPosRead';
                end
            end

        % Villain movement towards target position
        elseif playerNumber == 2
            if ~isempty(villainTargetPos)
                direction = villainTargetPos - villainPos;
                villainDistance = norm(direction);
                if villainDistance > 1
                    direction = direction / villainDistance;
                    speed = min(7, villainDistance * 0.1); % Adjust hero speed here
                    villainPos = villainPos + speed * direction; % Updating Villain position
                else
                    villainTargetPos = villainPos;  % Reset villain target to current position
                end
            end

            % Write villainPos to 'player2.xlsx'
            fid = fopen('player2.xlsx', 'w');
            fprintf(fid, '%f %f\n', villainPos);
            fclose(fid);

            % Read heroPos from 'player1.xlsx' if it exists
            if exist('player1.xlsx', 'file')
                fid = fopen('player1.xlsx', 'r');
                heroPosRead = fscanf(fid, '%f %f');
                fclose(fid);
                if numel(heroPosRead) == 2
                    heroPos = heroPosRead';

                end
            end
        end

        % Draw ships
        draw_object(mainAxis,ship,heroPos);
        draw_object(mainAxis,ship2,villainPos);

    end
print_title(axisTitle, 'Game Over');

% Blinking Colors
    while quitGame == false && playerNumber == 1
        i = i+1;
        if rem(i,3) == 0
            set(ship.patch,'EdgeColor', randi(10,1,3)/10);
            set(ship2.patch,'EdgeColor', randi(10,1,3)/10);
        end
    end