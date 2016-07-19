require 'rspec'
require_relative '../app/item'
require_relative '../app/virtual_item'

describe Item do

  before(:each) do
    @item = Item.new('kittle', price: 200)
  end
    
  it 'calculate price according to a formula' do
    expect @item.price == 232
  end

  it 'return info about item' do
    expect @item.to_s == 'kittle:232.0'
  end

end