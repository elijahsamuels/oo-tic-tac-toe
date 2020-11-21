class TicTacToe

    attr_accessor :board
        # a nested array filled with the index values for the eight winning combinations possible in Tic Tac Toe
    WIN_COMBINATIONS = [
        [0,1,2], # Top row
        [3,4,5],  # Middle row
        [6,7,8],  # Bottom row
        [0,3,6],  # Left Column
        [1,4,7],  # Center Column
        [2,5,8],  # Right Column
        [0,4,8],  # Left Down Diagonal
        [2,4,6]   # Right Down Diagonal
    ]
        # instance of the game must set the starting state of the board, an array with 9 empty strings " ". An instance variable named
    def initialize
        #@board = ([" "," "," "," "," "," "," "," "," "])
        @board = Array.new(9, " ")

    end


    def input_to_index=(input_to_index)
        @input_to_index = input_to_index.to_s
    end
    
        # Define a method into which we can pass user input (in the form of a string, e.g., "1", "5", etc.) and have it return to us the corresponding index of the @board array. Remember that, from the player's point of view, the board contains spaces 1-9. But the indices in an array start their count at 0. If the user inputs 5, your method must correctly translate that from the player's perspective to the array's perspective — accounting for the fact that @board[5] is not where the user intended to place their token.

    def input_to_index(userInputString)
        index = userInputString.to_i - 1
    end

        # a method that prints the current board representation based on the @board instance variable.
    def display_board
        puts " #{board[0]} | #{board[1]} | #{board[2]} "
        puts "-----------"
        puts " #{board[3]} | #{board[4]} | #{board[5]} "
        puts "-----------"
        puts " #{board[6]} | #{board[7]} | #{board[8]} "
    end

    #Your #move method must take in two arguments: the index in the @board array that the player chooses and the player's token (either "X" or "O"). The second argument, the player's token, should default to "X".

    def move(index, token = x)
        @board[index] = token
    end

    # The #position_taken? method will be responsible for evaluating the user's desired move against the Tic Tac Toe board and checking to see whether or not that position is already occupied. Note that this method will be running after #input_to_index, so it will be checking index values. When it is passed the index value for a prospective move, #position_taken? will check to see if that position on the @board is vacant or if it contains an "X" or an "O". If the position is free, the method should return false (i.e., "the position is not taken"); otherwise, it will return true.

    def position_taken?(index)
        @board[index] != " " 
    end

    def valid_move?(index)
        index.between?(0,8) && !position_taken?(index)        
    end

    def turn_count
        @board.count { |x| x != " " }
    end

    def current_player
        turn_count.even? ? "X" : "O"
    end

    def turn
        index = input_to_index(gets.chomp)
            if valid_move?(index) == true
                move(index, current_player)
                display_board
            else
                puts "Please try another move"
                turn 
            end
    end

    def won?
        WIN_COMBINATIONS.detect do |game|
            @board[game[0]] == @board[game[1]] &&
            @board[game[1]] == @board[game[2]] &&
            position_taken?(game[0])
        end
    
    end

    def full?
        @board.all?{|token| token == "X" || token == "O" }
    end

    def draw?
        !won? && full?
    end

    def over?
        draw? || won?
    end

    def winner
        if winning_game = won?
            @board[winning_game[0]]
        end
    end
                   
    def play      
        turn until over?
        puts winner ? "Congratulations #{winner}!" : "Cat's Game!"
    end



end


    # def board=(board)
    #     @board = board
    # end
    
    # def board
    #     @board
    # end

