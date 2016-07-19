require_relative "app/store_application"

StoreApplication.config do |app|
  app.name = "My Store"
  app.environment = :production

  app.admin do |admin|
    admin.email = "admin@mystore.com"
    admin.login = "admin"
    admin.send_info_emails_on :monday
  end
end

p StoreApplication.name
p StoreApplication::Admin.email

@items = []
@items << VirtualItem.new({price: 20,  weight: 18, name: 'car'})
@items << RealItem.new({price: 100, weight: 40, name: 'bike'})
@items << RealItem.new({price: 200, weight: 50, name: 'flash'})

cart = Cart.new('igor')
cart.add_item RealItem.new({price: 100, weight: 40, name: 'car'})
cart.add_item RealItem.new({price: 200, weight: 50, name: 'flash'})
# p cart.all_cars