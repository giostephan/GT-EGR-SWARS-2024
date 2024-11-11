% Initialize graphics
% Initializes the graphics for a player
function [mainAxis, ship, ship2, axisTitle, heroPos, villainPos] = initialize_graphics()

% Assign date conditions
todayDate = datetime('today'); % Check current date
shipset = '';
    if (month(todayDate) == 4) && (day(todayDate) == 1) % Check for April 1st
        shipset = 'aprilfoolsShips';
    elseif (month(todayDate) == 11) && (day(todayDate) >= 22) && (day(todayDate) <= 28) % Check for Thanksgiving
        shipset = 'thanksgivingShips';
    elseif (month(todayDate) == 12) && (day(todayDate) == 25) % Check for Christmas
        shipset = 'christmasShips';
    else
        shipset = 'defaultShips';
    end

% Assign ship skins based on ship set
    if strcmp(shipset, 'aprilfoolsShips')
        % April Fools Hero Ship
        SHIP_SHAPE = [ 2.37 2.23 1.222 0.98 1.52 1.93 2.84 2.95 3.76 3.92 4.87 4.94 5.59 5.94 5.22 5.24 2.37; % x values
        0.19 1.38 2.68 4.4 4.87 6.32 6.32 9.9 9.96 6.62 6.2 5.84 5.78 3.12 1.05 0 0.1 ]; % y values
        ship.w = 15; % Hero ship width
        ship.h = 30; % Hero ship height
        SHIP2_SHAPE = [1 0 0 0 0 0 1 1 1 2 3 4 5 5 5 6 6 6 6 6 5 4 3 2; ... %x values
        0 1 2 3 4 5 6 5 4 4 5 4 4 5 6 5 4 3 2 1 0 0 0 0]; %y values
        ship2.w = 15; % Villain ship width
        ship2.h = 20; % Villian ship height
    elseif strcmp(shipset, 'thanksgivingShips')
        % Thanksgiving Hero Ship (Turkey?)
        % Default Hero Ship
        SHIP_SHAPE = [1 0 0 0 0 0 1 1 1 2 3 4 5 5 5 6 6 6 6 6 5 5 5 4 3 2 1 1; ... % x values
        0 1 2 3 4 5 6 5 4 4 5 4 4 5 6 5 4 3 2 1 0 1 2 2 1 2 2 1]; % y values
        ship.w = 15; % Hero ship width
        ship.h = 20; % Hero ship height
        ship.w = 15; % Hero ship width
        ship.h = 20; % Hero ship height
        % Default villian ship
        SHIP2_SHAPE = [1 0 0 0 0 0 1 1 1 2 3 4 5 5 5 6 6 6 6 6 5 4 3 2; ... %x values
        0 1 2 3 4 5 6 5 4 4 5 4 4 5 6 5 4 3 2 1 0 0 0 0]; %y values
        ship2.w = 15; % Villain ship width
        ship2.h = 20; % Villian ship height
    elseif strcmp(shipset, 'christmasShips')
        % Christmas Tree Hero Ship
        SHIP_SHAPE = [ 2.5 2.5 0 1.1 0.5 2.1 1.5 2.7 2.5 3 3.5 3.3 4.5 3.9 5.5 4.9 6 3.5 3.5 2.5; % x values
        0 1 1 2.3 2.3 3.5 3.5 4.7 4.7 6 4.7 4.7 3.5 3.5 2.3 2.3 1 1 0 0]; % y values];
        ship.w = 15; % Hero ship width
        ship.h = 30; % Hero ship height
        % Default villian ship
        SHIP2_SHAPE = [1 0 0 0 0 0 1 1 1 2 3 4 5 5 5 6 6 6 6 6 5 4 3 2; ... %x values
        0 1 2 3 4 5 6 5 4 4 5 4 4 5 6 5 4 3 2 1 0 0 0 0]; %y values
        ship2.w = 15; % Villain ship width
        ship2.h = 20; % Villian ship height
    else
        % Default Hero Ship
        SHIP_SHAPE = [1 0 0 0 0 0 1 1 1 2 3 4 5 5 5 6 6 6 6 6 5 5 5 4 3 2 1 1; ... % x values
        0 1 2 3 4 5 6 5 4 4 5 4 4 5 6 5 4 3 2 1 0 1 2 2 1 2 2 1]; % y values
        ship.w = 15; % Hero ship width
        ship.h = 20; % Hero ship height
        % Default villian ship
        SHIP2_SHAPE = [1 0 0 0 0 0 1 1 1 2 3 4 5 5 5 6 6 6 6 6 5 4 3 2; ... %x values
        0 1 2 3 4 5 6 5 4 4 5 4 4 5 6 5 4 3 2 1 0 0 0 0]; %y values
        ship2.w = 15; % Villain ship width
        ship2.h = 20; % Villian ship height
    end

% Hero ship
xScale = ship.w / max(SHIP_SHAPE(1,:));
yScale = ship.h / max(SHIP_SHAPE(2,:));

% Villian ship
xScale2 = ship2.w / max(SHIP2_SHAPE(1,:));
yScale2 = ship2.h / max(SHIP2_SHAPE(2,:));

%coordinates for drawing hero at 0,0.

%scale hero so that he's HERO_W wide and HERO_H tall

ship.outline = [SHIP_SHAPE(1,:) .* xScale; SHIP_SHAPE(2,:) .* yScale]; % Scale hero outline
ship2.outline = [SHIP2_SHAPE(1,:) .* xScale2; SHIP2_SHAPE(2,:) .* yScale2]; % Scale villian outline

heroPos = [50 150]; % Hero starting position
villainPos = [150 150]; % Villian starting position

% Generate figure window
fig = figure;
set(fig,'color','black'); % Set background color to black
set(fig,'Resize','off');

% Pointer
pointer=NaN(16,16);
% Make cross shape pointer
pointer(4,1:7) = 2;
pointer(1:7,4)=2;
pointer(4,4)=1;

set(fig,'Pointer','Custom');
set(fig,'PointerShapeHotSpot',[4 4]); % Center pointer
set(fig,'PointerShapeCData',pointer);

% Set callback functions
set(fig,'KeyPressFcn',@keyDownListener);
set(fig,'WindowButtonDownFcn', @mouseDownListener);
set(fig,'WindowButtonUpFcn', @mouseUpListener);
set(fig,'WindowButtonMotionFcn', @mouseMoveListener);

% Form axis for plotting
mainAxis = axes();

AXIS_COLOR = [0, 0, 0]; % Sky color option
set(mainAxis, 'color', AXIS_COLOR, 'YTick', [], 'XTick', []); % Set axis background to black

% Axis title properties
%handle for displaying the score
axisTitle = title('');
font = 'Arcan';
large_text = 20;
green = [.1, .7, .1];
title_color = green;

% Apply properties to axis title
set(axisTitle,'fontsize', large_text) % set(axisTitle, 'FontName', font,'fontsize', large_text);
set(axisTitle, 'Color', title_color);
set(axisTitle,'fontname',font);

% Display range
axis([0 200 0 324]); % set size of the graphics window

axis off; % Hide frame and ticks

% Hero ship colors
ship.patch = patch(NaN,NaN,'r'); % Default Hero ship fill and color
    if strcmp(shipset, 'aprilfoolsShips')
        ship.patch = patch(NaN,NaN,[1.0, 0.85, 0.7]); % Hand color
    elseif strcmp(shipset, 'christmasShips')
        ship.patch = patch(NaN,NaN,[0.0, 0.4, 0.0]); % Festive green color
    end
set(ship.patch,'LineWidth', 2); % Hero ship outline
set(ship.patch,'EdgeColor', randi(10,1,3)/10 ); % Blinking outline

% Villian ship colors
ship2.patch = patch(NaN,NaN,'y'); % Villian ship fill and color
set(ship2.patch,'LineWidth', 2); % Villian ship outline
set(ship2.patch,'EdgeColor',randi(10,1,3)/10); % Blinking outline

% %host torpedos

% TORPEDO_1_FACE_COLOR = [0.1 0.7 0.1];

% TORPEDO_1_EDGE_COLOR = [0.1 0.7 0.1];

% TORPEDO_1_SHAPE = 'd';

% TORPEDO_1_SIZE = 5;

%

% set(torpedo_1, 'Marker', TORPEDO_1_SHAPE);

% set(torpedo_1, 'MarkerFaceColor', TORPEDO_1_FACE_COLOR);

% set(torpedo_1, 'MarkerEdgeColor', TORPEDO_1_EDGE_COLOR);

% set(torpedo_1, 'MarkerSize', TORPEDO_1_SIZE);

% set(torpedo_1, 'LineStyle', 'None');