class Board
  attr_accessor :cells

  def initialize
    @cells = [BoardCase.new,BoardCase.new,BoardCase.new,BoardCase.new,BoardCase.new,BoardCase.new,BoardCase.new,BoardCase.new,BoardCase.new]

  end

  def draw_board
    puts "\nBoard:"
    puts "\n #{@cells[0].value} | #{@cells[1].value} | #{@cells[2].value} "
    puts "-----------"
    puts " #{@cells[3].value} | #{@cells[4].value} | #{@cells[5].value} "
    puts "-----------"
    puts " #{@cells[6].value} | #{@cells[7].value} | #{@cells[8].value} "
    puts "\n"
  end

  def draw_legend
    puts "Legend: "
    puts "1|2|3"
    puts "4|5|6"
    puts "7|8|9"
    puts "\n"
  end
end
