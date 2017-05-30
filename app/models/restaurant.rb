require "pry"
require_relative "review.rb"
# require_relative "customer.rb"

class Restaurant

  attr_accessor :name

  @@all = []

  def initialize(name)
    @name = name
    @@all << self
  end

  def self.all
    @@all
  end

  def reviews
    Review.all.find_all{|review| review.restaurant == self}
  end

  def customers
    customer_array = Array.new
    Review.all.each do |review|
      if review.restaurant == self
        customer_array << review.customer
      end
    end
    customer_array
  end

end
