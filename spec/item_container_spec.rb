require 'rspec'
require_relative '../app/item'
require_relative '../app/virtual_item'
require_relative '../app/item_container'

class ItemBox
  include ItemContainer

  def initialize
    @items = []
  end

end

describe ItemContainer do

  before(:each) do
    @box = ItemBox.new
    @item1 = Item.new('kittle', price: 200)
    @item2 = Item.new('car', price: 400)
  end

  it 'adds items into container' do
    @box.add_item(@item1)
    @box.add_item(@item2)
    expect(@box.items.size).to eq(2)
  end

  it 'remove item from container' do
    @box.add_item(@item1)
    @box.add_item(@item2)
    expect(@box.remove_item).to be(@item2)
    @box.remove_item
    expect(@box.items).to be_empty
  end

  it 'raise error if trying adds some object instead item object' do
    expect(lambda{ @box.add_item('some string') }).to raise_error(NoMethodError)
  end

end