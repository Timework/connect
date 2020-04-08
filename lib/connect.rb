class Connect
    attr_reader :gameover, :tie, :board
    def initialize
        @gameover = false
        @tie = false
    end

    def create_board
        @board = []
        6.times do
            @board.push([1,1,1,1,1,1,1])
        end
    end

    def make_move(color, position, counter=0)
        position = position.to_i
        if @board[counter][position - 1] == 1
            @board[counter][position - 1] = color
        elsif counter == 5
            puts "That column is already full please pick another number."
            position = choose
            make_move(color, position)
        else
            counter += 1
            make_move(color, position, counter)
        end
    end

    def choose
        puts "Please pick a column from 1 to 7"
        answer = gets.chomp
        if answer.to_i > 7
            return choose
        elsif answer.to_i < 1
            return choose
        else
            return answer
        end
    end

    def horizontal_check
        @board.each_with_index do |x, index_x|
            x.each_with_index do |y, index_y|
                if y != 1
                    if index_y < 4
                        if y == @board[index_x][index_y + 1] && y == @board[index_x][index_y + 2] && y == @board[index_x][index_y + 3]
                            color = y
                            return wongame(color)
                        end
                    end
                end
            end
        end
    end

    def vertical_check
        @board.each_with_index do |x, index_x|
            x.each_with_index do |y, index_y|
                if y != 1
                    if index_x < 3
                        if y == @board[index_x + 1][index_y] && y == @board[index_x + 2][index_y] && y == @board[index_x + 3][index_y]
                            color = y
                            return wongame(color)
                        end
                    end
                end
            end
        end
    end

    def dia_check
        @board.each_with_index do |x, index_x|
            x.each_with_index do |y, index_y|
                if y != 1
                    if index_x < 3 && index_y < 4
                        if y == @board[index_x + 1][index_y + 1] && y == @board[index_x + 2][index_y + 2] && y == @board[index_x + 3][index_y + 3]
                            color = y
                            return wongame(color)
                        end
                    end
                    if index_x < 3 && index_y > 4
                        if y == @board[index_x + 1][index_y - 1] && y == @board[index_x + 2][index_y - 2] && y == @board[index_x + 3][index_y - 3]
                            color = y
                            return wongame(color)
                        end
                    end
                end
            end
        end
    end

    def tie_checker
        count = 0
        @board.each do |x|
            if x.include?(1)
                count += 1
            end
        end
        if count == 0
            puts "Tied Game"
            @tie = true
        end
    end

    def wongame(color)
        puts "#{color} won the game"
        @gameover = true
    end

    def show_board
        5.downto(0) {|x| puts @board[x].join(" ")}
        puts "1 2 3 4 5 6 7 positions" 
    end

    def play
        color = "R"
        create_board
        while !@gameover && !@tie
            show_board
            puts "#{color}'s turn'"
            position = choose
            make_move(color, position)
            horizontal_check
            if !@gameover
                vertical_check
            end
            if !@gameover
                dia_check
            end
            if !@gameover
                tie_checker
            end
            if @gameover
                show_board
            end
            if @tie
                show_board
            end
            if color == "R"
                color = "Y"
            else
                color = "R"
            end
        end
    end
end