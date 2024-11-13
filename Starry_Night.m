fig = figure;
set(fig, 'Color', 'black');

%                Star dust
x = randi([-200 200],15);           % x data
y = randi([-324 324],15);           % y data
starSizes = randi([30 100], 15);  % Varying star sizes
starColors = [ones(15, 1), ones(15, 1), ones(15, 1)]; % white Varying colors


%           Scatter the data on the figure
scatter(x, y, starSizes, starColors, 'filled','*', 'MarkerEdgeColor', 'white', 'MarkerFaceAlpha', 0.8);            % White stars

%               Customize the axes
 ax = gca;                     % Get current axes
 ax.Color = 'black';           % Set axis background color to black
 axis([0 200 0 324]);
 axis off;
 %                      Glowing halo
 hold on
  for i = 1:20
      scatter(x(i), y(i), starSizes(i)*1.5,'white','filled','*', 'MarkerFaceAlpha', 0.3, 'MarkerEdgeAlpha', 0); % halo illusion
  end
  hold off
 

%                Customize border
borderColor = 'cyan';         % border color
borderWidth = 10;             % border width 
annotation('rectangle', [0 0 1 1], 'Color', borderColor,'LineWidth', borderWidth); % border creation

