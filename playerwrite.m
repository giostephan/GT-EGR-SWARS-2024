function playerwrite(A,B,player)

switch player
    case 1
        % Write heroPos to 'player1.xlsx'
        fid = fopen( 'player1.xlsx', 'w' );
        fprintf( fid ,'%f %f', A );
        fclose( fid );
        %  Write torpedo pos to torpedo1
        fid = fopen('torpedo1.xlsx', 'w');
        fprintf( fid, '%f %f', B );
        fclose(fid);
    case 2
        % Write villainPos to 'player2.xlsx'
        fid = fopen('player2.xlsx', 'w');
        fprintf( fid, '%f %f', A );
        fclose(fid);
        fid = fopen('torpedo2.xlsx', 'w');
        fprintf( fid, '%f %f', B );
        fclose(fid);
end