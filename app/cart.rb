class Cart

  include ItemContainer

  class ItemNotSupported < StandardError
  end

  attr_reader :items

  UNSUPPORTED_CLASSES = [VirtualItem]

  def initialize(owner)
    @items = Array.new
    @owner = owner
  end

  def save_to_file
    File.open("files/#{@owner}_cart.txt", "w") do |f|
      @items.each do |i|
        raise ItemNotSupported if UNSUPPORTED_CLASSES.include?(i.class)
        f.puts i
      end
    end
  end

  def add_items(*items)
    @items += items
  end

  def read_from_file
    File.readlines("files/#{@owner}_cart.txt").each { |i| @items << i.to_real_item }
    @items.uniq!
  rescue Errno::ENOENT
    File.open("files/#{@owner}_cart.txt", "w") {}
    puts "File #{@owner}_cart.txt created!"
  end
end