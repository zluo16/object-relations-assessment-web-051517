require "pry"
require_relative "review.rb"
require_relative "restaurant.rb"

class Customer
  attr_accessor :first_name, :last_name

  @@all = []

  def initialize(first_name, last_name)
    @first_name = first_name
    @last_name  = last_name
    @@all << self
  end

  def full_name
    "#{first_name} #{last_name}"
  end

  def self.all
    @@all
  end

  def self.find_by_name(name)
    @@all.each do |customer|
      if name = customer.full_name
        return customer.full_name
      end
    end
  end

  def self.find_all_by_first_name(first_name)
    names = Array.new
    @@all.each do |customer|
      if customer.first_name = first_name
        names << customer.full_name
      end
    end
    names
  end

  def self.all_names
    @@all.map{|customer| customer.full_name}
  end

  def add_review(restaurant, content)
    Review.new(self, restaurant, content)
  end

end

mike = Customer.new("Mike", "Luo")
# puts Customer.find_by_name("Mike Luo")
mike_tyson = Customer.new("Mike", "Tyson")
# puts Customer.find_all_by_first_name("Mike")
stan = Customer.new("Stan", "Lee")
# puts Customer.all_names
winking_lizard = Restaurant.new("Winking Lizard Tavern")
cont = "content content content"

mike.add_review(winking_lizard, cont)
# puts Review.all.first.customer

puts Restaurant.all
puts winking_lizard.reviews
puts winking_lizard.customers.first.full_name
