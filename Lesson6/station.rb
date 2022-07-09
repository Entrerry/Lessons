require_relative 'modules'

class Station
  include InstanceCounter
  extend InstanceCounter
  attr_reader :title

  TITLE_FORMAT = /[a-z]/i
  @@all = []

  def self.all # метод класса (возвращает все станции)
    @@all
  end
  
  def initialize(title) # Имеет название, которое указывается при ее создании
    @title = title
    begin
    validate!
    rescue
      puts 'Title format is not valid!'
      return
    end
    @@all << self
    @trains = []
    register_instance
    puts "Station #{title.capitalize} has been created!"
  end

  def valid?
    validate!
    rescue
      false
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

  protected

  def validate!
    raise "Title format is not valid!" if title !~ TITLE_FORMAT
  end
end
