classdef (Abstract) Game
    % This is the Game base class.
    
    properties
        gameName
        numberOfPlayers
    end
    
    methods
        function obj = Game(gameName, numberOfPlayers)
            obj.gameName = gameName;
            obj.numberOfPlayers = numberOfPlayers;
        end
    end
    
    methods (Abstract)
        start(obj, players)
        turn(obj, players)
        move(obj, player)
        check_status(obj)
        check_tie(obj)
        random_move(obj)
        to_string(obj)
    end
end
