fig = figure;
set(fig, 'Color', 'black');

%                Star dust
x = randi(200,20);           % x data
y = randi(324,20);           % y data

%           Plot the data on the figure
plot(x, y, 'w*');            % White stars

%               Customize the axes
 ax = gca;                     % Get current axes
 ax.Color = 'black';           % Set axis background color to black
 axis([0 200 0 324]);
 axis off;
 

%                Customize border
borderColor = 'cyan';         % border color
borderWidth = 10;             % border width 
annotation('rectangle', [0 0 1 1], 'Color', borderColor,'LineWidth', borderWidth);
