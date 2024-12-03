function playersensor(player,axisTitle)
% Player sensor is a function that simply sets the title for the given
% player
% Input Arguments :
% player - player 1 or 2
% axisTitle - title above the game for player 1 or 2
switch player

    case 1
        print_title(axisTitle,'|   S W A R S  PLAYER [ 1 ]   |'); % Set player 1 window title

    case 2
        print_title(axisTitle,'|   S W A R S  PLAYER [ 2 ]   |'); % Set plater 2 window title

end