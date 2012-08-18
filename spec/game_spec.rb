require 'spec_helper'


shared_examples_for "no winners" do
  it "should have no winners" do
    game.winner.should be_nil
  end
end

describe Game do
  let(:game) { Game.new }
  it { game.should have(2).players}

  context "New" do
    let(:game) { Game.new }

    it_behaves_like "no winners"

    it "should initialize new board" do
     # game.board.should be_empty
    end  
    
    it "should initialize counter" do
      game.counter.should be_zero
    end
    
    it "should have not started yet state" do
      game.state.should be_not_started_yet
    end
  end
  
  context "Finished" do
    it "should return X winner" do
    end  
    
    it "should return O winner" do
    end

    it "should return no winner" do
    end
    
    it "should have finished state" do
      game.state.should be_finished
    end
  end
  
  context "In progress" do
    it_behaves_like "no winners"

    it "should have in progress state" do
      game.state.should be_in_progress
    end
    
    it "should return current player" do
    end

    it "should have no winners" do

    end
  end    
end