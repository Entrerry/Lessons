class Route 
  attr_reader :stations, :first, :last
  
  def initialize(first, last) # Имеет начальную и конечную станцию. Начальная и конечная станции указываются при создании маршрута.
    @first = first
    @last = last
    @stations = [first, last]
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
