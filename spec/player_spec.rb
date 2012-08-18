require 'spec_helper'

describe Player do

  before {Kernel.stub(:gets).and_return('qwqwe')}

  subject {Player.new}

  it { should have(2).players }

  it "should have a capitalized names" do
   subject.players.map {|player_name| player_name.capitalize == player_name }.uniq.should == [true]
  end

end