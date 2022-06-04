class Station
  def initialize(title) # Имеет название, которое указывается при ее создании
    @title = title
    @trains = []
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
end

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

class Train
  attr_reader :number, :type, :route_for_this_train
  attr_accessor :route_index
 
  def initialize(number, type, railway_carriage_count) # Имеет номер, тип, количество вагонов (указывается при создани)
    @speed = 0
    @number = number
    @type = type
    @railway_carriage_count = railway_carriage_count
  end

  def speed_up # Может набирать скорость
    @speed += 5
  end

  def show_speed # Может возвращать текущую скорость
    @speed
  end

  def speed_down # Может тормозить (сбрасывать скорость до нуля)
    @speed = 0
  end

  def show_railway_carriage_count # Может возвращать количество вагонов
    @railway_carriage_count
  end

  def add_railway_carriage # Может прицеплять вагоны, если поезд не движется
    @railway_carriage_count += 1 if @speed == 0
  end

  def remove_railway_carriage # Может отцеплять вагоны, если поезд не движется
    @railway_carriage_count -= 1 if @speed ==0
  end

  def add_to_route(route) # Может принимать маршрут следования
    @route_for_this_train = route
    @position_of_train_on_route = 0
    @route_for_this_train.stations[@position_of_train_on_route].add_train(self)
  end

  def move_forward # Может перемещаться вперёд
    @route_for_this_train.stations[@position_of_train_on_route].remove_train(self)
    @position_of_train_on_route += 1
    @route_for_this_train.stations[@position_of_train_on_route].add_train(self)
  end

  def move_back # Может перемещаться назад
    @route_for_this_train.stations[@position_of_train_on_route].remove_train(self)
    @position_of_train_on_route -= 1
    @route_for_this_train.stations[@position_of_train_on_route].add_train(self)
  end

  def show_neighbors # Возвращать предыдущую станцию, текущую, следующую, на основе маршрута
    [
      @route_for_this_train.stations[@position_of_train_on_route - 1],
      @route_for_this_train.stations[@position_of_train_on_route],
      @route_for_this_train.stations[@position_of_train_on_route + 1]
    ]
  end
end
