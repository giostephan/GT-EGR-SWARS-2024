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

% Call/set global variables
global torpedoPos heroTorpedoPos villainTorpedoPos R_C L_C mainAxis heroTargetPos villainTargetPos quitGame heroshootPos villainshootPos;  %#ok<GVMIS>

quitGame = false;

% Initialize graphics
[mainAxis, ship, ship2, axisTitle, heroPos, villainPos, fig, torpedo_1, torpedo_2] = initialize_graphics();

% Game console for each player
playersensor(player, axisTitle);

% Set keybinds for the figure / terminal for each player
% figHandle = gcf;
% set( figHandle, 'KeyPressFcn', @keyDownListener, 'WindowButtonUpFcn', @mouseUpListener, 'WindowButtonMotionFcn', @mouseMoveListener );
% set( mainAxis, 'ButtonDownFcn', @mouseDownListener );

% Movement
while ~quitGame
    playertextures( ship, ship2 );
    pause( 0.015 );
    % Hero movement
    switch player
        case 1
            % If the right trigger is clicked, move the ship to its
            % position
            if R_C
                [heroPos,heroTargetPos] = heromovement(heroTargetPos, heroPos);
            end

            if L_C
                [heroTorpedoPos] = heroshoot(heroPos, heroshootPos, torpedo_1);
                % If the torpedo leaves bounds, delete it
                if heroTorpedoPos(1) < 0 || heroTorpedoPos(1) > 1000 || heroTorpedoPos(2) < 0 || heroTorpedoPos(2) > 324
                    heroTorpedoPos = [];  % Clear torpedo position
                    L_C = false;
                end
            end

            % Write heroPos to 'player1.xlsx'
            fid = fopen('player1.xlsx', 'w');
            fprintf(fid, '%f %f\n', heroPos);
            fprintf(fid, '%f %f\n', heroTorpedoPos);
            fclose(fid);

            % Read villainPos from 'player2.xlsx' if it exists
            if exist('player2.xlsx', 'file')
                [villainPos, villainTorpedoPos] = shareplay(player);
                draw_torpedos(villainTorpedoPos, torpedo_2);
            end

        % Hero collision
            torpedo2hittingherodistance = villainTorpedoPos - heroPos;
            if torpedo2hittingherodistance <= 50
                quitGame = true;
            end

            % Villain movement towards target position
        case 2
            if R_C
                [villainTargetPos, villainPos] = villainmovement(villainTargetPos, villainPos);
            end

            if  L_C
                [torpedoPos] = villainshoot(villainPos,villainshootPos,torpedo_2);
                % If the torpedo leaves bounds, delete it
                if villainTorpedoPos(1) < 0 || villainTorpedoPos(1) > 1000 || villainTorpedoPos(2) < 0 || villainTorpedoPos(2) > 324
                    villainTorpedoPos = [];  % Clear torpedo position
                    L_C = false;
                end
            end

            % Write villainPos to 'player2.xlsx'
            fid = fopen('player2.xlsx', 'w');
            fprintf(fid, '%f %f\n', villainPos);
            fprintf(fid, '%f %f\n', villainTorpedoPos);
            fclose(fid);

            % Read heroPos from 'player1.xlsx' if it exists
            if exist('player1.xlsx', 'file')
                [heroPos, heroTorpedoPos] = shareplay(player);
                draw_torpedos(heroTorpedoPos, torpedo_1);
            end

    end

    % Draw ships
    draw_object(mainAxis,ship,heroPos);
    draw_object(mainAxis,ship2,villainPos);

    %  When left trigger is clicked, shoot the torpedo
    if L_C == true
        draw_torpedos(heroTorpedoPos, torpedo_1);
        draw_torpedos(villainTorpedoPos, torpedo_2)
    end
end

% To be implemented
for i = 1:1000
    pause(.001);
    print_title(axisTitle, 'Game Over');
    set(fig,'Color',randi(10,1,3)/10);
    playertextures(ship,ship2);
end

end