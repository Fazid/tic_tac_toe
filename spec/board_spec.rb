require 'spec_helper'

describe Board do
  it "should have 9 cells" do
    board = Board.new
    board.cells.flatten.count.should == 9
  end

  context "initialize board" do
    it "should not raise exceptions with valid array size and valid data" do
      valid_data = [[0, 1, nil]] * 3
      expect { Board.new(valid_data) }.not_to raise_error(ArgumentError)
    end

    it "should not raise exceptions with no data" do
      expect { Board.new }.not_to raise_error(ArgumentError)
    end

    it "should raise exceptions with not valid array size" do
      not_valid_data = [[0, 1, nil]] * 2
      expect { Board.new(not_valid_data) }.to raise_error(ArgumentError)
    end

    it "should raise exceptions with invalid data" do
      invalid_data = [[0, 2, nil]] * 3
      expect { Board.new(invalid_data) }.to raise_error(ArgumentError)
    end
  end

  context ".checkLine" do
    before (:each) do
      @newBoard = Board.new
    end

    it "should return true if three cells in horizontal vertical line are the same but not nul" do
      @newBoard.cells = [[1, 1, 1],[nil, nil, nil],[nil, nil, nil]]
      @newBoard.instance_variable_set(:@x_y, [0,0])
      @newBoard.checkLine.should be_true
    end

    it "should return true if three cells in vertical line are the same but not nul" do
      @newBoard.cells = [[nil, nil, 1],[nil, nil, 1],[nil, nil, 1]]
      @newBoard.instance_variable_set(:@x_y, [2,0])
      @newBoard.checkLine.should be_true
    end

    it "should return true if three cells in diagonal line are the same but not nul" do
      @newBoard.cells = [[nil, nil, 0],[nil, 0, nil],[0, nil, nil]]
      @newBoard.instance_variable_set(:@x_y, [1,1])
      @newBoard.checkLine.should be_true
    end

  end

  context ".checkNumberOfCoordinates" do
    it "should return true if number of coordinates is valid"  do
      @newBoard = Board.new
      @newBoard.checkNumberOfCoordinates([0,0]).should be_true
    end

    it "should return false if number of coordinates is not valid"  do
      @newBoard = Board.new
      @newBoard.checkNumberOfCoordinates([0,]).should be_false
    end
  end

  context ".checkCoordinates" do
    it "should return true if coordinates are valid"  do
      @newBoard = Board.new
      @newBoard.checkCoordinates([1,1]).should be_true
    end

    it "should return false if coordinates are not valid"  do
      @newBoard = Board.new
      @newBoard.checkCoordinates([1,3]).should be_false
    end
  end


  context ".empty?" do
    it "should be empty" do
      @newBoard = Board.new([[nil, nil, nil],[nil, nil, nil],[nil, nil, nil]])
      @newBoard.should be_empty
    end

    it "should not be empty" do
      @newBoard = Board.new([[nil, 0, 1]] * 3)
      @newBoard.should_not be_empty
    end
  end

  context ".boardFull?" do
    it "should be full"  do
      @newBoard = Board.new
      @newBoard.cells = [[1, 1, 1],[0, 0, 0],[2, 2, 2]]
      @newBoard.boardFull?.should be_true
    end
  end
end
