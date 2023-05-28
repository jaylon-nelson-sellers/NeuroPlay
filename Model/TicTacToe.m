classdef TicTacToe < Game
    % This is the TicTacToe subclass, which inherits from Game.

    properties
        board  % Initialize the game board
    end

    methods
        function obj = TicTacToe()
            % Call the constructor of the base class:
            obj = obj@Game('Tic Tac Toe', 2);
            obj.board = zeros(3);  % Initialize the game board
        end

        function start(obj, players)
            % Initialize the game
            obj.board = zeros(3);
            disp(['Starting ', obj.gameName, ' with ', num2str(obj.numberOfPlayers), ' players.']);
            while true
                % Players take turns
                obj = obj.turn([1 -1]);

                % Check if the game is over
                if obj.check_status() ~= 0 || obj.check_tie()
                    break;
                end
            end
        end

        function obj = turn(obj, players)
            % This method could handle turn taking, alternating between players
            for player = players
                disp(['It is player ', num2str(player), ' turn.']);
                obj = obj.move(player);
                obj.to_string();

                if obj.check_status()
                    disp(['Player ', num2str(player), ' wins!']);
                end

                if obj.check_tie()
                    disp('The game is a tie.');
                    return;
                end
            end
        end

        function obj = move(obj, player)
            % This method generates a random valid move for the current player
            validMove = false;
            while ~validMove
                [row, col] = obj.random_move();
                if obj.board(row, col) == 0
                    obj.board(row, col) = player;
                    validMove = true;
                end
            end
        end

        function winner = check_status(obj)
            % This method checks the game status, i.e., whether there is a winner
            lines = [-1, 0, 1];
            for line = lines
                diag1 = diag(obj.board, line);
                diag2 = diag(flipud(obj.board), line);
                checks = [sum(obj.board, 1), sum(obj.board, 2)', diag1', diag2'];
                if any(checks == 3)
                    winner = 1;
                    return;
                elseif any(checks == -3)
                    winner = -1;
                    return;
                end
            end
            winner = 0;
        end

        function tie = check_tie(obj)
            % This method checks if the game is a tie
            tie = ~any(obj.board == 0, 'all');
        end

        function [row, col] = random_move(obj)
            % This method generates a random valid move
            [rows, cols] = find(obj.board == 0);
            idx = randi(length(rows));
            row = rows(idx);
            col = cols(idx);
        end

        function to_string(obj)
            % This method prints the game board
            disp(obj.board);
        end
    end
end
