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
    validate!
    @@all << self
    @trains = []
    register_instance
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

  def trains_to_block(&block) # блок
    @trains.each { |train| block.call(train) }
  end

  protected

  def validate!
    raise "Title format is not valid!" if title !~ TITLE_FORMAT
  end
end
