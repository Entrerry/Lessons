require_relative 'modules'

class Station
  include InstanceCounter
  extend InstanceCounter
  attr_reader :title

  @@all = []

  def self.all # метод класса (возвращает все станции)
    @@all
  end
  
  def initialize(title) # Имеет название, которое указывается при ее создании
    @title = title
    @trains = []
    #@@all_stations << self
    register_instance
  end

  def add_train(train) # Может принимать поезда (по одному за раз)
    return if @trains.include?(train)
    @trains << train
  end

  def remove_train(train) # Может отправлять поезда
    @trains.delete(train)
  end

  def trains_list # Может возвращать список всех поездов на станции, находящиеся в текущий момент
    @trains
  end

  def trains_list_by_type(type) # Может возвращать список поездов на станции по типу: кол-во грузовых, пассажирских
    @trains.select do |train|
      train.type == type
    end
  end

  def show_title
    @title
  end
end
