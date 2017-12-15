
require 'pry'
class Owner

require_relative "fish"
require_relative "cat"
require_relative "dog"

  attr_reader :species
  attr_accessor :pets, :name

  @@count = 0
  @@all = []

  def initialize(species)
    @species = species
    @pets = {fishes: [], cats: [], dogs: []}
    @name = name

    @@count += 1
    @@all << self
  end

  def self.all
    @@all
  end

  def self.reset_all
    @@all.clear
    @@count = 0
  end

  def self.count
    @@count
  end

  def say_species
    "I am a #{species}."
  end

  def buy_fish(name)
    @pets[:fishes] << Fish.new(name)
  end

  def buy_cat(name)
    @pets[:cats] << Cat.new(name)
  end

  def buy_dog(name)
    @pets[:dogs] << Dog.new(name)
  end

  def walk_dogs
    self.pets[:dogs][0].mood = "happy"
  end

  def play_with_cats
    self.pets[:cats][0].mood = "happy"
  end

  def feed_fish
    self.pets[:fishes][0].mood = "happy"
  end

  def sell_pets
    self.pets.values.each do |pet_arr|
      pet_arr.each do |pet_instance|
        pet_instance.mood = "nervous"
      end
    end
    self.pets.clear
  end

  def list_pets
    "I have #{self.pets[:fishes].length} fish, #{self.pets[:dogs].length} dog(s), and #{self.pets[:cats].length} cat(s)."

  end

end
