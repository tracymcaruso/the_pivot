# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).

class Seed

  attr_reader :rachel, :jeff, :jorge, :josh, :ordered, :paid, :cancelled, :completed
  def self.start
    new.generate
  end

  def generate
    create_vendors
    create_vendor_items
    create_users
    create_statuses
    create_items
    create_orders
    create_categories
  end

  def create_vendors
    @vendor = Vendor.create!(name:"Peter's Produce")
    @vendor2 = Vendor.create!(name:"Minnie's Smokin' Hot Sauce")
    @vendor3 = Vendor.create!(name:"Tracy's Berries")
    @vendor4 = Vendor.create!(name: "Jorge's Chalupa Stand")
  end


  def create_vendor_items
    item = {title: "Squash", description: "It's good for you", price: 200, image: open('app/assets/images/squash.jpg')}
    item1 = {title: "Minnie-Burn", description: "Ooowee, it's spicy", price: 100, image: open('app/assets/images/hot_sauce.jpg')}
    item2 = {title: "Tracy's Trio", description: "Boy howdy, these berries sure are mighty tasty", price: 500, image: open('app/assets/images/berries_2.jpg')}
    item3 = {title: "Deep Fried Delight", description: "Better than Taco Bell", price: 200, image: open('app/assets/images/chalupas.jpg')}
    @vendor.items.create!(item)
    @vendor2.items.create!(item1)
    @vendor3.items.create!(item2)
    @vendor4.items.create!(item3)
  end

  def create_users
    @rachel = RegisteredUser.create!(full_name: "Rachel Warbelow", password: "password", email: "demo_rachel@jumpstartlab.com")
    @jeff = RegisteredUser.create!(full_name: "Jeff Casimir", password: "password", display_name: "j3", email: "demo_jeff@jumpstartlab.com")
    @jorge = RegisteredUser.create!(full_name: "Jorge Tellez", password: "password", display_name: "novohispano", email: "demo_jorge@jumpstartlab.com")
    @josh = BusinessAdministrator.create!(full_name: "Josh Cheek", password: "password", display_name: "josh", email: "demo_josh@jumpstartlab.com", vendor: @vendor)

    puts "#{User.all.map(&:full_name).join(", ")} created."
  end

  def create_statuses
    @ordered = Status.create!(name: "ordered")
    @paid = Status.create!(name: "paid")
    @cancelled = Status.create!(name: "cancelled")
    @completed = Status.create!(name: "completed")

    puts "Statuses created"
  end

  def create_items
    Item.create!(title: "Turing Assessment Week", description: "A miserable dog seasoned with the tears of students", price: 200, image: File.open('app/assets/images/sad_dog.jpg'))
    Item.create!(title: "Yellow Dog", description: "A hotdog with mustard", price: 250, image: File.open('app/assets/images/hotdog_costume.jpg'))
    Item.create!(title: "Sunset Dog", description: "A hotdog with mustard and ketchup", price: 400)
    Item.create!(title: "Rainbow Dog", description: "A hotdog with relish, ketchup, relish, and mustard", price: 450, image: File.open('app/assets/images/everything_dog.jpg'))
    Item.create!(title: "Salty Dog", description: "A hotdog on a pretzel bun", price: 600, image: File.open('app/assets/images/pretzel_dog.jpg'))
    Item.create!(title: "Wet Dog Smell", description: "A hotdog where the bun has been soaked in vodka", price: 1000)
    Item.create!(title: "Bahn Mi Dog", description: "A hotdog with picked vegetables", price: 800, image: File.open('app/assets/images/bahn_mi.jpg'))
    Item.create!(title: "Raining Cats and Dog", description: "A hotdog with a side of rain water", price: 500)
    Item.create!(title: "Banana Split Dog", description: "A banana on a hot dog bun with whipped cream", price: 700, image: File.open('app/assets/images/banana.jpeg'))
    Item.create!(title: "Sundae", description: "A banana on a hot dog bun with nuts and whipped cream", price: 800, image: File.open('app/assets/images/sundae.jpeg'))
    Item.create!(title: "Weiner Dog", description: "A weinerschitzel with a side of sauerkraut", price: 550, image: File.open('app/assets/images/nyc_hot_dog.jpg'))
    Item.create!(title: "Veggie Dog", description: "A lettuce wrap with a veggie hotdog", price: 450, image: File.open('app/assets/images/lettuce.jpg'))
    Item.create!(title: "Sinatra Dog", description: "A hotdog that's classy", price: 600)
    Item.create!(title: "Dancing Dog", description: "A hotdog habeneros and jalapenos", price: 300, image: File.open('app/assets/images/nacho_dog.jpg'))
    Item.create!(title: "Sean's Footlong", description: "A hotdog with ketchup", price: 200)
    Item.create!(title: "Texas Dog", description: "A hotdog with chili", price: 200, image: File.open('app/assets/images/chili_dog.png'))
    Item.create!(title: "Red or Green Dog", description: "A hotdog with your choice of chile", price: 250)
    Item.create!(title: "Heart Attack Dog", description: "A donut bun with bacon as the meat", price: 1200, image: File.open('app/assets/images/bacon.jpg'))
    Item.create!(title: "Sean's Delicious Sausage", description: "A hotdog with chololate syrup", price: 300)
    Item.create!(title: "Lasso Dog", description: "A hotdog with fried onions", price: 400, image: File.open('app/assets/images/onions.jpg'))
    Item.create!(title: "Cowboy Kyle Dog", description: "A hotdog every topping, including chocolate", price: 500)

    puts "Items created"
  end

  def create_orders
    Order.create!(user_id: @rachel.id, status_id: @ordered.id, order_date: DateTime.new(2015, 4, 5), items: [Item.find(16), Item.find(9), Item.find(16), Item.find(16), Item.find(2), Item.find(2)])
    Order.create!(user_id: @rachel.id, status_id: @paid.id, order_date: DateTime.new(2015, 4, 6), items: [Item.find(2), Item.find(4)])
    Order.create!(user_id: @jeff.id, status_id: @ordered.id, order_date: DateTime.new(2015, 4, 7), items: [Item.find(5)])
    Order.create!(user_id: @jeff.id, status_id: @paid.id, order_date: DateTime.new(2015, 4, 8), items: [Item.find(4)])
    Order.create!(user_id: @jeff.id, status_id: @completed.id, order_date: DateTime.new(2015, 4, 8), items: [Item.find(14), Item.find(13)])
    Order.create!(user_id: @jorge.id, status_id: @completed.id, order_date: DateTime.new(2015, 4, 9), items: [Item.find(1)])
    Order.create!(user_id: @jorge.id, status_id: @ordered.id, order_date: DateTime.new(2015, 4, 10), items: [Item.find(11)])
    Order.create!(user_id: @jorge.id, status_id: @cancelled.id, order_date: DateTime.new(2015, 5, 5), items: [Item.find(19), Item.find(9)])
    Order.create!(user_id: @jeff.id, status_id: @cancelled.id, order_date: DateTime.new(2015, 5, 6), items: [Item.find(18)])
    Order.create!(user_id: @rachel.id, status_id: @paid.id, order_date: DateTime.new(2015, 5, 7), items: [Item.find(19)])
    puts "Orders created"
  end

  def create_categories
    Category.create!(name: "Spicy", items: [Item.find(20), Item.find(13), Item.find(16)])
    Category.create!(name: "Dessert", items: [Item.find(10), Item.find(9), Item.find(8), Item.find(17)])
    Category.create!(name: "Kyle's faves", items: [Item.find(5), Item.find(20)])
    Category.create!(name: "Real", items: [Item.find(6)])
    Category.create!(name: "Puns", items: [Item.find(8), Item.find(5)])
    Category.create!(name: "All Items", items: Item.all)
    puts "Categories Created"
  end

end

Seed.start
