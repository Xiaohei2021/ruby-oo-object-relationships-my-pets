require 'pry'

  class Owner
  @@all = []

    attr_reader :name, :species

    def initialize(name)
      @name = name
      @species = "human"
      @pets = []
      save
    end

  def say_species
    "I am a #{@species}."
    # binding.pry
  end

  def save
    @@all << self
  end

  def self.all
    @@all
  end

  def self.count
    self.all.count
  end

  def self.reset_all
    self.all.clear
  end

  def pets
    @pets
    # binding.pry
  end

  def cats
    Cat.all.select {|cat| cat.owner == self}
  end

  def dogs
    Dog.all.select {|dog| dog.owner == self}
    # @pets << self.dogs
  end


  def buy_cat(name)
    Cat.new(name, self)
    # binding.pry
  end

  def buy_dog(name)
    Dog.new(name, self)
  end

  def walk_dogs
    self.dogs.each do |dog|
      dog.mood = "happy"
    end 
  end

  def feed_cats
    self.cats.each do |cat|
      cat.mood = "happy"
    end 
  end

  def sell_pets

    # [fido, tabby].each { |o| expect(o.mood).to eq("nervous")
    # self.dogs.each do |dog|
    #   dog.mood = "nervous"
    #   dog.owner = nil
    # end

    # self.cats.each do |cat|
    #   cat.mood = "nervous"
    #   cat.owner = nil
    # end

    [cats, dogs].each do |pets|
      pets.each do |pet|
        pet.mood = "nervous"
        pet.owner = nil
      end
    end
    


  end

  def list_pets
    "I have #{self.dogs.count} dog(s), and #{self.cats.count} cat(s)."
  end

end