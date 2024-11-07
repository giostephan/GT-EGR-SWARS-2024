function  swars(player)
% swars the ultimate space shooter game
% Input Arguments  |
%      * player - may select up to 2 players, 1 or 2
% Output Arguments |
%      * Extreme Dopamine Rush
% 
% - - - *| G A M E  C O N T R O L S | * - - -

% Prompt for game setup (wireless play and hosting)
i = 0;
WIRELESSPLAY = input('WIRELESS PLAY? [Y] | [N]','s');
    if upper(WIRELESSPLAY(1)) == 'Y'
        HOST = input('ARE YOU HOSTING [Y] | [N]','s');

    if upper(HOST(1)) =='Y'
        player1 = tcpserver('192.168.12.203', 42056); % Read IP - hardcoded for now but should be prompted for eventually
                                                      % Port number - Might change for ever server start
    end
    if upper(HOST(1)) == 'N'
        player1 = tcpclient('0.0.0.0',42056); 
    end

pause(2);
    end

playerNumber = player;

% Call/set global variables

global right_button;  %#ok<GVMIS>
% global left_button;  %#ok<GVMIS>

global quitGame;      %#ok<GVMIS>
quitGame = false;

% Player 1 and Player 2 positions

%   hero - Player 1
%   villian - Player 2
heroPos = [50 150]; % unused
villainPos = [150 150]; % unused

% Initialize graphics
[mainAxis, ship, ship2, axisTitle ,heroPos ,villainPos] = initialize_graphics();
    if playerNumber == 1
        print_title(axisTitle,'S W A R S PLAYER 1') % Set player 1 window title
        elseif playerNumber == 2
            print_title(axisTitle,'S W A R S PLAYER 2') % Set plater 2 window title
    end

% Draw objects - This section should be moved to another file
pause(0.015);
draw_object(mainAxis,ship,heroPos);
draw_object(mainAxis,ship2,villainPos);


    % Blinking colors
    while quitGame == false && playerNumber == 1
        i = i+1;
        if rem(i,3) == 0
            set(ship.patch,'EdgeColor', randi(10,1,3)/10);
            set(ship2.patch,'EdgeColor', randi(10,1,3)/10);
        end

% Movement

% Hero position and movement
    if right_button == true
        [mousePos] = get_mouse_position(mainAxis);
        Xi = heroPos(1);
        Xf = mousePos(1);
        Yi = heroPos(2);
        Yf = mousePos(2);
        XDistance = linspace(min(Xi),max(Xf),20);
        YDistance = linspace(min(Yi),max(Yf),20);
        img = [XDistance; YDistance]';
        right_button = false;
        for i = 1:20
            pause(.015)
            draw_object(mainAxis,ship,img(i,:))
        end
heroPos = [Xf Yf];
    else
    end
    if WIRELESSPLAY == 'N'
        fid = fopen('player1.xlsx','w');
        fprintf(fid,'%f %f\n',heroPos);
        fclose(fid);
        fid = fopen('player2.xlsx','r');
        vmousePos = fscanf(fid,'%f %f\n');
    else
        fwrite(player1,heroPos);
        vmousePos =   fread(player1,villainPos);
    end

Xiv = villainPos(1);
Xfv = vmousePos(1);
Yiv = villainPos(2);
Yfv = vmousePos(2);
vXDistance = linspace(Xiv,Xfv,20);
vYDistance = linspace(Yiv,Yfv,20);
img = [vXDistance; vYDistance]';
    for i = 1:20
        pause(0.015)
        draw_object(mainAxis,ship2,img(i,:))
    end
villainPos = [Xfv Yfv];
fclose(fid);

    end
    while quitGame == false && playerNumber == 2
        i= i+1;
    if rem(i,3) == 0
        set(ship2.patch,'EdgeColor', randi(10,1,3)/10 );
        set(ship.patch,'EdgeColor', randi(10,1,3)/10 );
    end

% Villian movement

    if right_button == true
        [mousePos] = get_mouse_position(mainAxis);
        Xiv = villainPos(1);
        Xfv = mousePos(1);
        Yiv = villainPos(2);
        Yfv = mousePos(2);
        vXDistance = linspace(Xiv,Xfv,20);
        vYDistance = linspace(Yiv,Yfv,20);
        img = [vXDistance; vYDistance]';
        right_button = false;
            for i = 1:20
                pause(.015)
                draw_object(mainAxis,ship2,img(i,:))
            end

villainPos = [Xfv Yfv];

    end

    if WIRELESSPLAY == 'N'
        fid = fopen('player2.xlsx','w');
        fprintf(fid,'%f %f\n',villainPos);
        fclose(fid);
        fid = fopen('player1.xlsx','r');
        mousePos= fscanf(fid,'%f %f\n');
    else
        fwrite(player1,villainPos);
        mousePos =   fread(player1,heroPos);
    end

Xi = heroPos(1);
Xf = mousePos(1);
Yi = heroPos(2);
Yf = mousePos(2);
XDistance = linspace(Xi,Xf,20);
YDistance = linspace(Yi,Yf,20);
img = [XDistance; YDistance]';
    for i = 1:20
        pause(0.015)
        draw_object(mainAxis,ship,img(i,:))
    end
heroPos = [Xf Yf];
fclose(fid);

    end
    end