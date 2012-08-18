class Player
  def players
    @player = [nil, nil]

    for i in 0..1 do
      puts 'puts player'+"#{i}"+' name'
      @player[i] = gets.chomp.capitalize
    end
    @player
  end
end

