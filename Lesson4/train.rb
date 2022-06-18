class Train
  attr_reader :number, :type, :route_for_this_train
  attr_accessor :route_index, :railway_carriages
 
  def initialize(number) # Имеет номер, тип, количество вагонов (указывается при создани)
    @speed = 0
    @number = number
    @type = nil
    @railway_carriages = []
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

  def current_station # Возвращать текущую станцию.
    @route_for_this_train.stations[@position_of_train_on_route]
  end

  def show_railway_carriage_count # Может возвращать количество вагонов
    @railway_carriages.length
  end

  def add_railway_carriage(railway_carriage) # Может прицеплять вагоны(того же типа, что и поезд), если поезд не движется
    return false unless railway_carriage.type == @type
      @railway_carriages << railway_carriage if @speed == 0
      #end
    #end
  end

  def remove_railway_carriage(railway_carriage) # Может отцеплять вагоны, если поезд не движется
    @railway_carriages.delete(railway_carriage) if @speed ==0
    #end
  end
end
