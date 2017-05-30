require "pry"
# require_relative "customer.rb"
require_relative "restaurant.rb"

class Review

  attr_accessor :restaurant, :customer

  @@all = []

  def self.all
    @@all
  end

  def initialize(customer, restaurant, content)
    @customer = customer
    @restaurant = restaurant
    @content = content
    @@all << self
  end

  def customer
    @customer
  end

  def restaurant
    @restaurant
  end

end

# mike = Customer.new("Mike", "Luo")
# # puts Customer.find_by_name("Mike Luo")
# mike_tyson = Customer.new("Mike", "Tyson")
# # puts Customer.find_all_by_first_name("Mike")
# stan = Customer.new("Stan", "Lee")
# # puts Customer.all_names
# winking_lizard = Restaurant.new("Winking Lizard Tavern")
# cont = "content content content"
#
# mike.add_review(winking_lizard, cont)
# puts Review.all.first.customer.full_name
