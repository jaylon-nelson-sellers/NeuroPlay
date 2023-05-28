classdef (Abstract) Game
    %GAME Summary of this class goes here
    %   Detailed explanation goes here

    properties
        game_name
        board
        num_of_players
    end

    methods
        function obj = Game(board_input)
            obj.board = board_input;
        end

        function winner = start(obj, players)

        end

        function obj = turn(obj, players)
            
        end

        function obj = move(obj, player)

        end

        function status = check_status(obj)
        
        end

        function validity = check_valid(obj)
        
        end

        function game_state = get_board(obj)
            
        end

        function obj = check_winner(obj)

        end

        function obj = check_tie(obj)
        end

        function move = random_move()
        
        end

        function output = to_string(obj)
            output = obj.board;
        end
    end
end

