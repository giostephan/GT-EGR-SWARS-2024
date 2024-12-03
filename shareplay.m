function [Pos, torpedoPos] = shareplay(player)
% shareplay is a function that reads each file for the given player
% Input arguments:
% player - player 1 or 2
% Output Arguments:
% Pos - player position
% torpedoPos - torpedo position

% Delete torpedo vector arrays
Pos = [NaN NaN];
torpedoPos = [NaN NaN];

switch player
    case 1
        % Open player two files to be read for player 1 terminal
        fid = fopen('player2.xlsx', 'r');
        villainPosRead = fscanf(fid, '%f', 2);
        if numel(villainPosRead) == 2
            Pos = villainPosRead';
        end

        torpedoPosRead = fscanf(fid, '%f', 2);
        if numel(torpedoPosRead) == 2
            torpedoPos = torpedoPosRead';
        end
        fclose(fid);

    case 2
        % Open player one files to be read for player 2 terminal
        fid = fopen('player1.xlsx', 'r');
        heroPosRead = fscanf(fid, '%f', 2);
        if numel(heroPosRead) == 2
            Pos = heroPosRead';
        end

        torpedoPosRead = fscanf(fid, '%f', 2);
        if numel(torpedoPosRead) == 2
            torpedoPos = torpedoPosRead';
        end
        fclose(fid);

end