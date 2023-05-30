classdef TicTacToe < Game
    %TICTACTOE Summary of this class goes here
    %   Detailed explanation goes here

    properties

    end

    methods
        function obj = TicTacToe()
            board = zeros(3,3);
            obj@Game("TicTacToe",2, board);
        end

        function winner = human_bot_game(obj)
            % Initialize winner
            winner = 0;
            while winner == 0
                % Get the human player's move
                [row, col] = obj.get_human_move();

                % Check if the player decided to quit the game
                if row == -1 || col == -1
                    disp("Exiting");
                    return;
                end

                % Update the board with the human player's move
                obj.board(row, col) = 1;
                disp(obj.to_string());

                % Check game status
                winner = obj.check_game_status(1);
                if winner ~= 0
                    break;
                end

                % Bot's turn
                fprintf('The bot is making a move...\n');
                [row, col] = obj.random_move();
                obj.board(row, col) = 2;
                disp(obj.to_string());

                % Check game status
                winner = obj.check_game_status(2);
            end
        end

        function [row, col] = get_human_move(obj)
            while true
                row = input('Enter row: ');
                col = input('Enter column: ');

                if row == -1 || col == -1 || obj.check_valid(row, col)
                    break;
                end

                fprintf('Invalid Move. Try again.\n');
            end
        end

        function winner = check_game_status(obj, player)
            if obj.check_win(obj.board, player)
                fprintf(['Player ', num2str(player), ' wins!\n']);
                winner = player;
            elseif obj.check_tie(obj.board)
                fprintf('The game is a tie.\n');
                winner = -1;
            else
                winner = 0;
            end
        end


        function winner = bot_game(obj, bot_1, bot_2)

        end

        function complete = turn(obj, players)

        end

        function complete = move(obj, player)

        end

        function validity = check_valid(obj, row, col)
            % Check if a move to the given position is valid
            if row < 1 || row > 3 || col < 1 || col > 3
                validity = false;
            elseif obj.board(row, col) ~= 0
                validity = false;
            else
                validity = true;
            end
        end

        function game_status = check_win(obj, board, player)
            % Check if the player has won
            game_status = false;

            % Check rows
            if any(all(board == repmat(player, 3, 1), 2))
                game_status = true;
                return;
            end

            % Check columns
            if any(all(board == repmat(player, 1, 3), 1))
                game_status = true;
                return;
            end

            % Check diagonals
            if all(diag(board) == player) || all(diag(fliplr(board)) == player)
                game_status = true;
                return;
            end
        end

        function game_status = check_tie(obj, board)
            game_status = all(board(:) ~= 0);
        end

        function [row, col] = random_move(obj)
            % Generate a random valid move
            valid = false;
            while ~valid
                % Generate a random valid move
                [valid_rows, valid_cols] = find(obj.board == 0);
                idx = randi(length(valid_rows));
                row = valid_rows(idx);
                col = valid_cols(idx);
                valid = obj.check_valid(row, col);
            end
        end

        function string = to_string(obj)
            string = obj.board;
        end
    end
end

