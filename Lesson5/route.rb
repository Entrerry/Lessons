require_relative 'modules'

class Route 
  include InstanceCounter
  extend InstanceCounter
  attr_reader :stations, :first, :last

  @@all = []

  def self.all # метод класса (возвращает все маршруты)
    @@all
  end
  
  def initialize(first, last) # Имеет начальную и конечную станцию. Начальная и конечная станции указываются при создании маршрута.
    @first = first
    @last = last
    @stations = [first, last]
    register_instance
  end

  def add_station(station) # Промежуточные станции могут добавляться между начальной и конечной.
    @stations.insert(1, station)
  end

  def delete_station(station) # Может удалять промежуточную станцию из списка
    @stations.delete(station)
  end

  def show_route # Может выводить список всех станций
    @stations
  end
end
