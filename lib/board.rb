class Board
  attr_accessor :cells

  def initialize(cells = [[nil, nil, nil],[nil, nil, nil],[nil, nil, nil]])
    validate cells
    @cells = cells
  end


  def empty?
    @cells.flatten.all? do |cell|
      cell.nil?
    end
  end

  def boardFull?
    @cells.flatten.all? do |cell|
      !cell.nil?
    end
  end

  def checkLine

    if @cells[@x_y[0]][0] == @cells[@x_y[0]][1] &&  @cells[@x_y[0]][1] == @cells[@x_y[0]][2] ||
      @cells[0][@x_y[1]]== @cells[1][@x_y[1]] &&  @cells[1][@x_y[1]] == @cells[2][@x_y[1]]
       return true
    end

    if "#{@x_y[0]}"+"#{@x_y[1]}" == "00" || "#{@x_y[0]}"+"#{@x_y[1]}" == "11" || "#{@x_y[0]}"+"#{@x_y[1]}" == "22"
      if @cells[0][0] == @cells[1][1] &&  @cells[1][1] == @cells[2][2]
        return true
      end
    end

    if "#{@x_y[0]}"+"#{@x_y[1]}" == "02" || "#{@x_y[0]}"+"#{@x_y[1]}" =="11" || "#{@x_y[0]}"+"#{@x_y[1]}" =="20"
      if @cells[0][2] == @cells[1][1] &&  @cells[1][1] == @cells[2][0]
        return true
      end
    end
  end




  def putsCells
    puts cells[0].inspect
    puts cells[1].inspect
    puts cells[2].inspect
  end


  def coordinates
    puts "Coordinates (x, y) of board cells"
    puts [[0,0],[0,1],[0,2]].inspect
    puts [[1,0],[1,1],[1,2]].inspect
    puts [[2,0],[2,1],[2,2]].inspect
  end


  def checkNumberOfCoordinates(w)
    if w.length==2
      return true
    else
       puts 'Not full data'
       return false
    end
  end


  def checkCoordinates(r)
    r.each do |cell|
      if [0, 1, 2].include? cell
        @x_y=r
      else
        puts 'Wrong coordinates. Try again.'
        return false
      end
    end
    return true
  end


  def getsCheckCoordinates

    correctDara = false
    while (correctDara == false)

      fulldata=false
      while(fulldata == false)
        @x_y_temp = gets.chomp.split(/,/).to_a.map! { |x| x.to_i }
        fulldata=checkNumberOfCoordinates(@x_y_temp)
      end

      correctDara=checkCoordinates(@x_y_temp)

    end
  end


  def input1_0 (i)
    while (1)
      if cells[@x_y[0]][@x_y[1]].nil?
        cells[@x_y[0]][@x_y[1]]= i
        break
      else
        puts 'This cell is occupied. Choose another one.'
        getsCheckCoordinates
      end
    end
  end



  private

  def validate cells
    raise ArgumentError unless cells.length == 3
    cells.each do |row|
      raise ArgumentError unless row.length == 3
      row.each { |cell| raise ArgumentError unless [nil, 0, 1].include? cell }
    end
  end

end