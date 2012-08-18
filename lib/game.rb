require_relative "board.rb"
require_relative "player.rb"

class Game
  attr_accessor :counterGames, :score


  def initialize(counterGames = 0, score=[0, 0])
    @counterGames = counterGames
    @score = score
  end


  def changePlayerFirstMove(i)
    if @counterGames % 2 == 1
      @k= 1-i
    else
      @k=i
    end
  end


  def putsScore
    puts 'Score '+@newPlayer.instance_variable_get(:@player)[0].to_s+' : '+@newPlayer.instance_variable_get(:@player)[1].to_s+' - '+@score[0].to_s+' : '+@score[1].to_s
  end


  def askNewGameOrNewSet
    puts "Do you want to play another game? (yes/no) If you want to start a new set type (res)"

    while !['yes', 'no', 'res'].include? @startNewGame = gets.chomp
      puts 'type yes, no or res'
    end

    if  @startNewGame == 'yes'
      @newBoard.cells = [[nil, nil, nil],[nil, nil, nil],[nil, nil, nil]]
    elsif @startNewGame == 'no'
      return 'Stop game'
    else
      @counterGames=0
      @score=[0, 0]
      putsScore
    end

  end



  def oneGameProcess
    finish_game = false

    while (!finish_game) do

      for i in 0..1 do

        changePlayerFirstMove (i)
        puts @newPlayer.instance_variable_get(:@player)[@k].to_s+' puts x, y'
        @newBoard.getsCheckCoordinates
        @newBoard.input1_0(i)
        @newBoard.putsCells

        if  finish_game=@newBoard.checkLine
          puts @newPlayer.instance_variable_get(:@player)[@k].to_s+' win!'
          @score[@k] += 1
          break
        end

        if  finish_game=@newBoard.boardFull?
          puts 'The game ended in a draw'
          break
        end

      end

    end
  end


  def setProcess
    finish_set=false

    while(!finish_set)

      oneGameProcess
      @counterGames +=1
      putsScore

      if askNewGameOrNewSet == 'Stop game'
        break
      end

    end
  end


  def gameLoop

    @newPlayer = Player.new
    @newPlayer.players

    @newBoard = Board.new
    @newBoard.coordinates

    setProcess

  end
end