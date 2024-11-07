% Initialize graphics
% initialize_graphics.m version 3

function [mainAxis, ship, ship2, axisTitle, heroPos, villainPos] = initialize_graphics()
% Initializes the graphics for a player

SHIP_START_Y = 20; %hero start position

ship.w = 15; %hero width

ship.h = 20; %hero height

SHIP_SHAPE = [1 0 0 0 0 0 1 1 1 2 3 4 5 5 5 6 6 6 6 6 5 5 5 4 3 2 1 1; ... %x values

0 1 2 3 4 5 6 5 4 4 5 4 4 5 6 5 4 3 2 1 0 1 2 2 1 2 2 1]; %y values

xScale = ship.w / max(SHIP_SHAPE(1,:));

yScale = ship.h / max(SHIP_SHAPE(2,:));

ship2.w = 15; %hero width

ship2.h = 20; %hero height

SHIP2_SHAPE = [1 0 0 0 0 0 1 1 1 2 3 4 5 5 5 6 6 6 6 6 5 4 3 2; ... %x values

0 1 2 3 4 5 6 5 4 4 5 4 4 5 6 5 4 3 2 1 0 0 0 0]; %y values

xScale2 = ship2.w / max(SHIP2_SHAPE(1,:));

yScale2 = ship2.h / max(SHIP2_SHAPE(2,:));

%coordinats for drawing hero at 0,0.

%scale hero so that he's HERO_W wide and HERO_H tall

ship.outline = [SHIP_SHAPE(1,:) .* xScale; SHIP_SHAPE(2,:) .* yScale];

ship2.outline = [SHIP2_SHAPE(1,:) .* xScale2; SHIP2_SHAPE(2,:) .* yScale2];

heroPos = [50 150];

villainPos = [150 150];

fig = figure;

set(fig,'color','black');

set(fig,'Resize','off');

pointer=NaN(16,16);

pointer(4,1:7) = 2;

pointer(1:7,4)=2;

pointer(4,4)=1;

set(fig,'Pointer','Custom');

set(fig,'PointerShapeHotSpot',[4 4]);

set(fig,'PointerShapeCData',pointer);

set(fig,'KeyPressFcn',@keyDownListener);

set(fig,'WindowButtonDownFcn', @mouseDownListener);

set(fig,'WindowButtonUpFcn', @mouseUpListener);

set(fig,'WindowButtonMotionFcn', @mouseMoveListener);

mainAxis = axes();

%set color for the court, hide axis ticks.

AXIS_COLOR = [0, 0, 0]; %the sky

set(mainAxis, 'color', AXIS_COLOR, 'YTick', [], 'XTick', []);

%handle for displaying the score

axisTitle = title('');

font = 'Arcan';

large_text = 20;

green = [.1, .7, .1];

title_color = green;

set(axisTitle,'fontsize', large_text)

%set(axisTitle, 'FontName', font,'fontsize', large_text);

set(axisTitle, 'Color', title_color);

set(axisTitle,'fontname',font);

%set size of the graphics window

axis([0 200 0 324]);

axis off;

%hero ship

ship.patch = patch(NaN,NaN,'r');

set(ship.patch,'LineWidth', 2);

set(ship.patch,'EdgeColor', randi(10,1,3)/10 );

%villainship

ship2.patch = patch(NaN,NaN,'y');

set(ship2.patch,'LineWidth', 2);

set(ship2.patch,'EdgeColor',randi(10,1,3)/10);

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