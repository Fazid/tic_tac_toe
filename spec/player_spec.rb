require 'spec_helper'

describe Player do

  subject {Player.new}

  it { should have(2).players }
 # its(:players) {{|player_name| player_name.capitalize == player_name }.should be_true }

 # it "should have a capitalized names" do
 #   subject.players.each {|player_name| player_name.capitalize == player_name }.should be_true

 #end

end