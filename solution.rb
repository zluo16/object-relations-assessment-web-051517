
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
