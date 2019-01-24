class Player
  attr_accessor :name, :symbol, :taken_cells

  def initialize(name, symbol)
    @name = name
    @symbol = symbol
    @taken_cells = []
  end

end
