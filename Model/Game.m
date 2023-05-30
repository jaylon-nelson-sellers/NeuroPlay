classdef (Abstract) Game
    % This is the Game base class.
    
    properties
        gameName
        numberOfPlayers
        board
        moves
        winner
    end
    
    methods
        function obj = Game(gameName, numberOfPlayers, board)
            obj.gameName = gameName;
            obj.numberOfPlayers = numberOfPlayers;
            obj.board = board;
        end
    end
    
    methods (Abstract)
        human_bot_game(obj, bot_1)
        bot_game(obj, bot_1, bot_2)
        turn(obj, players)
        move(obj, player)
        check_valid(move)
        check_win(board, player)
        check_tie(board)
        random_move(obj)
        to_string(obj)
    end
end
