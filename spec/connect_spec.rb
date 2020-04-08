require './lib/connect'

RSpec.describe Connect do

    before(:each) do
        @game = Connect.new
    end

describe "#new" do
    it "Gameover is readable and set to false in a new game" do
        expect(@game.gameover).to eql(FALSE)
    end

    it "Tie is readable and set to false in a new game" do
        expect(@game.tie).to eql(FALSE)
    end
end

describe "#board_create" do
    it "Properly makes board" do
        @game.create_board
        expect(@game.board).to eql([[1,1,1,1,1,1,1],[1,1,1,1,1,1,1],[1,1,1,1,1,1,1],[1,1,1,1,1,1,1],[1,1,1,1,1,1,1],[1,1,1,1,1,1,1]])
    end
end

describe "#make_move" do
    it "properly puts tile" do
        @game.create_board
        @game.make_move("R", 5)
        expect(@game.board).to eql([[1,1,1,1,"R",1,1],[1,1,1,1,1,1,1],[1,1,1,1,1,1,1],[1,1,1,1,1,1,1],[1,1,1,1,1,1,1],[1,1,1,1,1,1,1]])
    end

    xit "asks you to select another position if it is full" do
        @game.create_board
        @game.make_move("R", 5)
        @game.make_move("R", 5)
        @game.make_move("R", 5)
        @game.make_move("R", 5)
        @game.make_move("R", 5)
        @game.make_move("R", 5)
        @game.make_move("R", 5)
        expect(@game.board).to eql([[1,1,1,1,"R","R",1],[1,1,1,1,"R",1,1],[1,1,1,1,"R",1,1],[1,1,1,1,"R",1,1],[1,1,1,1,"R",1,1],[1,1,1,1,"R",1,1]])
    end
end

describe "#choose" do
    xit "it returns the right number" do
        expect(@game.choose).to eql("4")
    end
end

describe "#horizontal_check" do
    it "returns true when there is a horizontal line on the first row" do
        @game.create_board
        @game.make_move("R", 1)
        @game.make_move("R", 2)
        @game.make_move("R", 3)
        @game.make_move("R", 4)
        @game.horizontal_check
        expect(@game.gameover).to eql(TRUE)
    end

    it "returns true when there is a horizontal line not on the first row" do
        @game.create_board
        @game.make_move("R", 1)
        @game.make_move("Y", 2)
        @game.make_move("R", 3)
        @game.make_move("Y", 4)
        @game.make_move("R", 1)
        @game.make_move("Y", 2)
        @game.make_move("R", 3)
        @game.make_move("Y", 4)
        @game.make_move("R", 1)
        @game.make_move("R", 2)
        @game.make_move("R", 3)
        @game.make_move("R", 4)
        @game.horizontal_check
        expect(@game.gameover).to eql(TRUE)
    end

    it "returns false when there is not a horizontal line on the first row" do
        @game.create_board
        @game.make_move("R", 1)
        @game.make_move("Y", 2)
        @game.make_move("R", 3)
        @game.make_move("Y", 4)
        @game.make_move("R", 5)
        @game.make_move("Y", 6)
        @game.horizontal_check
        expect(@game.gameover).to eql(FALSE)
    end

    it "returns false when there is not a horizontal line anywhere" do
        @game.create_board
        @game.make_move("R", 1)
        @game.make_move("Y", 2)
        @game.make_move("R", 3)
        @game.make_move("Y", 4)
        @game.make_move("R", 5)
        @game.make_move("Y", 6)
        @game.make_move("R", 1)
        @game.make_move("Y", 2)
        @game.make_move("R", 3)
        @game.make_move("Y", 4)
        @game.make_move("R", 5)
        @game.make_move("Y", 6)
        @game.horizontal_check
        expect(@game.gameover).to eql(FALSE)
    end
end

describe "#wongame" do
    it "gameover equals true" do
        @game.wongame("R")
        expect(@game.gameover).to eql(TRUE)
    end
end

describe "#vertical_check" do
    it "returns true when there is a vertical line on the base" do
        @game.create_board
        @game.make_move("R", 1)
        @game.make_move("R", 1)
        @game.make_move("R", 1)
        @game.make_move("R", 1)
        @game.vertical_check
        expect(@game.gameover).to eql(TRUE)
    end

    it "returns true when there is a vertical line anywhere" do
        @game.create_board
        @game.make_move("Y", 1)
        @game.make_move("R", 1)
        @game.make_move("R", 1)
        @game.make_move("R", 1)
        @game.make_move("R", 2)
        @game.make_move("Y", 2)
        @game.make_move("Y", 2)
        @game.make_move("Y", 2)
        @game.make_move("R", 3)
        @game.make_move("Y", 3)
        @game.make_move("Y", 3)
        @game.make_move("Y", 3)
        @game.make_move("Y", 3)
        @game.vertical_check
        expect(@game.gameover).to eql(TRUE)
    end

    it "returns false when there is not a vertical line on the first row" do
        @game.create_board
        @game.make_move("R", 1)
        @game.make_move("Y", 2)
        @game.make_move("R", 3)
        @game.make_move("Y", 4)
        @game.make_move("R", 5)
        @game.make_move("Y", 6)
        @game.vertical_check
        expect(@game.gameover).to eql(FALSE)
    end

    it "returns false when there is not a vertical line anywhere" do
        @game.create_board
        @game.make_move("R", 1)
        @game.make_move("Y", 2)
        @game.make_move("R", 3)
        @game.make_move("Y", 4)
        @game.make_move("R", 5)
        @game.make_move("Y", 6)
        @game.make_move("R", 1)
        @game.make_move("Y", 2)
        @game.make_move("R", 3)
        @game.make_move("Y", 4)
        @game.make_move("R", 5)
        @game.make_move("Y", 6)
        @game.make_move("Y", 1)
        @game.make_move("R", 2)
        @game.make_move("Y", 3)
        @game.make_move("R", 4)
        @game.make_move("Y", 5)
        @game.make_move("R", 6)
        @game.make_move("Y", 1)
        @game.make_move("R", 2)
        @game.make_move("Y", 3)
        @game.make_move("R", 4)
        @game.make_move("Y", 5)
        @game.make_move("R", 6)
        @game.vertical_check
        expect(@game.gameover).to eql(FALSE)
    end
end

describe "#dia_check" do
    it "return true if there is a right dia on the base level" do
        @game.create_board
        @game.make_move("R", 1)
        @game.make_move("Y", 2)
        @game.make_move("Y", 3)
        @game.make_move("Y", 4)
        @game.make_move("Y", 1)
        @game.make_move("R", 2)
        @game.make_move("Y", 3)
        @game.make_move("Y", 4)
        @game.make_move("Y", 1)
        @game.make_move("Y", 2)
        @game.make_move("R", 3)
        @game.make_move("Y", 4)
        @game.make_move("Y", 1)
        @game.make_move("Y", 2)
        @game.make_move("Y", 3)
        @game.make_move("R", 4)
        @game.dia_check
        expect(@game.gameover).to eql(TRUE)
    end

    it "return true if there is a left dia on the base level" do
        @game.create_board
        @game.make_move("Y", 1)
        @game.make_move("Y", 2)
        @game.make_move("Y", 3)
        @game.make_move("R", 4)
        @game.make_move("Y", 1)
        @game.make_move("Y", 2)
        @game.make_move("R", 3)
        @game.make_move("Y", 4)
        @game.make_move("Y", 1)
        @game.make_move("R", 2)
        @game.make_move("Y", 3)
        @game.make_move("Y", 4)
        @game.make_move("R", 1)
        @game.make_move("Y", 2)
        @game.make_move("Y", 3)
        @game.make_move("Y", 4)
        @game.dia_check
        expect(@game.gameover).to eql(TRUE)
    end

    it "return true if there is a right dia anywhere" do
        @game.create_board
        @game.make_move("K", 1)
        @game.make_move("K", 2)
        @game.make_move("K", 3)
        @game.make_move("K", 4)
        @game.make_move("R", 1)
        @game.make_move("Y", 2)
        @game.make_move("Y", 3)
        @game.make_move("Y", 4)
        @game.make_move("Y", 1)
        @game.make_move("R", 2)
        @game.make_move("Y", 3)
        @game.make_move("Y", 4)
        @game.make_move("Y", 1)
        @game.make_move("Y", 2)
        @game.make_move("R", 3)
        @game.make_move("Y", 4)
        @game.make_move("Y", 1)
        @game.make_move("Y", 2)
        @game.make_move("Y", 3)
        @game.make_move("R", 4)
        @game.dia_check
        expect(@game.gameover).to eql(TRUE)
    end

    it "return true if there is a left dia anywhere" do
        @game.create_board
        @game.make_move("K", 1)
        @game.make_move("K", 2)
        @game.make_move("K", 3)
        @game.make_move("K", 4)
        @game.make_move("Y", 1)
        @game.make_move("Y", 2)
        @game.make_move("Y", 3)
        @game.make_move("R", 4)
        @game.make_move("Y", 1)
        @game.make_move("Y", 2)
        @game.make_move("R", 3)
        @game.make_move("Y", 4)
        @game.make_move("Y", 1)
        @game.make_move("R", 2)
        @game.make_move("Y", 3)
        @game.make_move("Y", 4)
        @game.make_move("R", 1)
        @game.make_move("Y", 2)
        @game.make_move("Y", 3)
        @game.make_move("Y", 4)
        @game.dia_check
        expect(@game.gameover).to eql(TRUE)
    end

    it "return false if there is not a dia anywhere" do
        @game.create_board
        @game.make_move("Y", 1)
        @game.make_move("Y", 2)
        @game.make_move("Y", 3)
        @game.make_move("Y", 4)
        @game.make_move("R", 1)
        @game.make_move("R", 2)
        @game.make_move("R", 3)
        @game.make_move("R", 4)
        @game.make_move("Y", 1)
        @game.make_move("Y", 2)
        @game.make_move("Y", 3)
        @game.make_move("Y", 4)
        @game.make_move("R", 1)
        @game.make_move("R", 2)
        @game.make_move("R", 3)
        @game.make_move("R", 4)
        @game.make_move("Y", 1)
        @game.make_move("Y", 2)
        @game.make_move("Y", 3)
        @game.make_move("Y", 4)
        @game.make_move("R", 1)
        @game.make_move("R", 2)
        @game.make_move("R", 3)
        @game.make_move("R", 4)
        @game.dia_check
        expect(@game.gameover).to eql(FALSE)
    end
end

describe "#tie_checker" do
    it "it returns false when there are still some blocks unmarked vertically" do
        @game.create_board
        @game.make_move("Y", 1)
        @game.make_move("Y", 1)
        @game.make_move("Y", 1)
        @game.make_move("Y", 1)
        @game.make_move("R", 1)
        @game.make_move("R", 1)
        @game.tie_checker
        expect(@game.tie).to eql(FALSE)
    end

    it "it returns false when there are still some blocks unmarked horizontally" do
        @game.create_board
        @game.make_move("Y", 1)
        @game.make_move("Y", 2)
        @game.make_move("Y", 3)
        @game.make_move("Y", 4)
        @game.make_move("R", 5)
        @game.make_move("R", 6)
        @game.make_move("R", 7)
        @game.tie_checker
        expect(@game.tie).to eql(FALSE)
    end

    it "it returns true when there are no blocks available" do
        @game.create_board
        @game.make_move("Y", 1)
        @game.make_move("Y", 2)
        @game.make_move("Y", 3)
        @game.make_move("Y", 4)
        @game.make_move("R", 5)
        @game.make_move("R", 6)
        @game.make_move("Y", 1)
        @game.make_move("Y", 2)
        @game.make_move("Y", 3)
        @game.make_move("Y", 4)
        @game.make_move("R", 5)
        @game.make_move("R", 6)
        @game.make_move("Y", 1)
        @game.make_move("Y", 2)
        @game.make_move("Y", 3)
        @game.make_move("Y", 4)
        @game.make_move("R", 5)
        @game.make_move("R", 6)
        @game.make_move("Y", 1)
        @game.make_move("Y", 2)
        @game.make_move("Y", 3)
        @game.make_move("Y", 4)
        @game.make_move("R", 5)
        @game.make_move("R", 6)
        @game.make_move("Y", 1)
        @game.make_move("Y", 2)
        @game.make_move("Y", 3)
        @game.make_move("Y", 4)
        @game.make_move("R", 5)
        @game.make_move("R", 6)
        @game.make_move("Y", 1)
        @game.make_move("Y", 2)
        @game.make_move("Y", 3)
        @game.make_move("Y", 4)
        @game.make_move("R", 5)
        @game.make_move("R", 6)
        @game.make_move("R", 7)
        @game.make_move("R", 7)
        @game.make_move("R", 7)
        @game.make_move("R", 7)
        @game.make_move("R", 7)
        @game.make_move("R", 7)
        @game.tie_checker
        expect(@game.tie).to eql(TRUE)
    end
end

describe "#show_board" do
    it "showboard doesn't crash the program" do
        @game.create_board
        @game.make_move("Y", 1)
        @game.make_move("Y", 2)
        @game.make_move("Y", 3)
        @game.make_move("Y", 4)
        @game.make_move("R", 5)
        @game.make_move("R", 6)
        @game.make_move("Y", 1)
        @game.show_board
        expect(@game.gameover).to eql(FALSE)
    end
end

describe "#play" do
    it "Game works until gameover or tie" do
        @game.play
        expect(@game.tie).to eql(TRUE)
    end
end
end