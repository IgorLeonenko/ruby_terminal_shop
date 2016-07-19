class Order

  include ItemContainer

  attr_reader :items

  def initialize
    @items = Array.new
  end

end