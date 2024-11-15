numSpecks = 250;
frameCount = 1000;
xLimits = [0,60];
ylimits = [0,20];

fig = figure;
set(fig,'Color','black');
fig;
axis([xLimits, ylimits]);
axis off;
x = rand(1, numSpecks)*(xLimits(2)-xLimits(1))+xLimits(1);
y = rand(1, numSpecks)*(ylimits(2)-ylimits(1))+ylimits(1);


starSizes = rand(3, numSpecks); % varying star sizes
h = scatter(x, y,starSizes,'w','filled','*','MarkerEdgeColor','flat');
ax = gca;
ax.Color = 'black';
axis off;


borderWidth = 10; % border width
borderColor = 'cyan'; % border color
annotation('rectangle', [0 0 1 1], ...
                   'EdgeColor', borderColor, 'LineWidth', borderWidth);

score_hero = 0;
score_villian = 0;
hitscore_hero = ['Hero:',num2str(score_hero)];
hitscore_villian = ['Villian:',num2str(score_villian)];

score_box = rectangle('Position',[0,17,60,3],'EdgeColor','w','LineWidth',2,'FaceColor','k');
text_hitscore_hero = text(5,18,['Hero:',num2str(score_hero)],'FontSize',14,'FontName','Comic Sans MS ','FontWeight', 'bold','Color','b','HorizontalAlignment','left','VerticalAlignment','middle');
text_hitscore_villian = text(55,18,['Villain:',num2str(score_villian)],'FontSize',14,'FontName','Comic Sans MS ','FontWeight', 'bold','Color','r','HorizontalAlignment','right','VerticalAlignment','middle');
for frame = 1:frameCount
    x = x-(rand(1,numSpecks) + 0.5)*0.5;
    y = y-(rand(1,numSpecks) + 0.5)*0.5;

    x = mod(x-xLimits(1), xLimits(2) - xLimits(1))+ xLimits(1);
    y = mod(y - ylimits(1), ylimits(2) - ylimits(1))+ylimits(1);

    set(h, 'XData' , x, 'YData', y);
    drawnow;
    pause(0.05);
end