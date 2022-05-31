class Station
  attr_reader :trains, :title

  def initialize(title)
    @trains = [] 
    @title = title
  end

  def add_train(train) 
    @trains << train unless @trains.include?(train)
  end

=begin
  def show_trains_all
    puts trains
  end
=end

  def trains_by_type(type)
    @trains.count { |train| train.type == type }
  end

  def send_train(train) 
    @trains.delete(train)
  end
end

class Route
  attr_reader :stations, :first, :last
  
  def initialize(first, last)
    @first = first
    @last = last
    @stations = [first, last]
  end

  def add_station(station)
    @stations.insert(1, station)
  end

  def delete_station(station)
    @stations.delete(station)
  end

  def show_route
    @stations.each do |station|
      puts station.title
    end
  end
end

class Train
  attr_reader :speed, :type, :railway_carriage_count, :number

  def initialize(number, type, railway_carriage_count)
    @index_station = 0
    @speed = 0
    @railway_carriage_count = railway_carriage_count
    @number = number
    @type = type
    #puts "We have train num. #{number}. Type is #{type}. And the train has #{railway_carriage_count} railway carriages."
  end

  def speed_up
    @speed += 5
  end

  def show_speed
    puts "Current train speed: #{@speed}"
  end

  def brake
    @speed = 0
  end

  def show_railway_carriage_count
    puts "Train num. #{@number} has #{@railway_carriage_count} railway carriages."
  end

  def add_railway_carriage
    @railway_carriage_count += 1 if @speed == 0  
  end

  def delete_railway_carriage
    @railway_carriage_count -= 1 if @speed == 0
  end

  def get_route(route)
    @route = route
  end

  def next_station
    @route.stations[@index_station + 1]
  end

  def previous_station
    @route.stations[@index_station - 1]
  end

  def show_location
    @route.stations[@index_station]
  end
end

station = Station.new('Depot')

route = Route.new('Depot', 'Moscow')
puts route.stations

puts ' '
train1 = Train.new(666, 'passenger train', 5)
station.add_train(train1)
puts station.trains
train1.show_speed
puts ' '
train2 = Train.new(667, 'freight train', 20)
#train2.show_location
train2.show_speed
puts ' '


