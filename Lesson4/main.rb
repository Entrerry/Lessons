require_relative 'train'
require_relative 'train_passenger'
require_relative 'train_cargo'
require_relative 'station'
require_relative 'route'
require_relative 'railway_carriage'
require_relative 'railway_carriage_passenger'
require_relative 'railway_carriage_cargo'

stations = []
trains = []
routes = []

loop do
  puts '##################################'
  puts '- (1)Create new ststion.'
  puts '- (2)Create new train.'
  puts '- (3)Create new route.'
  puts '- (4)Add station to route.'
  puts '- (5)Assign a route to a train.'
  puts '- (6)Add railway carriages to a train.'
  puts '- (7)Unhitch the railway carriages from the train.'
  puts '- (8)Move the train forward and backward along the route.'
  puts '- (9)View a list of stations and a list of trains in a station.'
  puts '##################################'
  print 'Choose a section: '
  answer = gets.chomp.to_i
  
  case answer
  when 1 # создание станций
    print 'Enter station name: '
    name = gets.chomp
    puts "Station #{name} has been created!"
    stations << Station.new(name)
  when 2 # создание поездов
    print 'Enter train number: '
    number = gets.chomp.to_i
    print 'Enter train type (passenger/cargo):'
    type = gets.chomp
    puts "#{type.capitalize} train, number #{number} has been created!"
    trains << CargoTrain.new(number) if type == 'cargo'
    trains << PassengerTrain.new(number) if type == 'passenger'
  when 3 # создание маршрутов
    puts "We have #{stations.count} stations."
    stations.each_with_index do |s, i| puts "#{i + 1}. #{s.show_title.capitalize}"
    end
    print "Chose number of the first station: "
    start = gets.chomp.to_i
    print "Chose number of the last station: "
    finish = gets.chomp.to_i
    routes << Route.new(stations[start - 1], stations[finish - 1])
    puts "Route from #{stations[start - 1].show_title.capitalize} to #{stations[finish - 1].show_title.capitalize} has been created!"
  when 4 # добавление станции в маршрут
    puts "We have #{stations.count} stations."
    stations.each_with_index do |s, i| puts "#{i + 1}. #{s.show_title.capitalize}"
    end
    puts "And we have routes"
    routes.each_with_index do |r, i| puts "#{i + 1}. Route from #{r.first.show_title.capitalize} to #{r.last.show_title.capitalize}"
    end
    puts "Choose station: "
    answer = gets.chomp.to_i
    puts "Choose route: "
    answer2 = gets.chomp.to_i
    routes[answer2 - 1].add_station(stations[answer - 1]) 
  when 5 # назначение маршрута поезду
    puts "We have #{trains.count} trains and #{routes.count} routes."
    puts "Choose the train, to assign the route."
    trains.each_with_index do |t, i| puts "#{i + 1}. #{t.type.to_s.capitalize} train, number #{t.number}"
    end
    answer1 = gets.chomp.to_i
    puts "Choose the route."
    routes.each_with_index do |r, i| puts "#{i + 1}. Route from #{r.first.show_title.capitalize} to #{r.last.show_title.capitalize}"
    end
    answer2 = gets.chomp.to_i
    trains[answer1 - 1].add_to_route(routes[answer2 - 1])
    puts "Route from #{routes[answer2 - 1].first.show_title.capitalize} to #{routes[answer2 - 1].last.show_title.capitalize} has been assign for train number #{trains[answer1 - 1].number.to_s}"
  when 6 # добавление вагонов к поезду
    puts "Choose the train to add railway carriage."
    trains.each_with_index do |t, i| puts "#{i + 1}. #{t.type.to_s.capitalize} train, number #{t.number}"
    end
    answer = gets.chomp.to_i
      if trains[answer - 1].type == :cargo
        trains[answer - 1].add_railway_carriage(CargoRailwayCarriage.new)
      elsif trains[answer - 1].type == :passenger
        trains[answer - 1].add_railway_carriage(PassengerRailwayCarriage.new)
      end
    puts "Train number #{trains[answer - 1].number} now has #{trains[answer - 1].show_railway_carriage_count} railway carriages."
  when 7 # отцепка вагонов от поезда
    trains.each_with_index do |t, i| puts "#{i + 1}. #{t.type.to_s.capitalize} train, number #{t.number} with #{t.show_railway_carriage_count} railway carriages"
    end
    print "Choose the train to add railway carriage: "
    answer = gets.chomp.to_i
    trains[answer - 1].remove_railway_carriage(trains[answer - 1].railway_carriage_count[0])
  when 8 # перемещение поезда
    trains.each_with_index do |t, i| puts "#{i + 1}. #{t.type.to_s.capitalize} train, number #{t.number}"
    end
    print "Choose the train to move: "
    answer = gets.chomp.to_i
    print "Press 1 to move forward or 2 to move backward:"
    dir = gets.chomp.to_i
    if dir == 1
      trains[answer - 1].move_forward
    elsif dir == 2
      trains[answer - 1].move_back
    end
  when 9 # просмотр списка станций и список поездов
    puts '##################################'
    puts '######### Station List ###########'
    puts "\t!!EMPTY!!" if stations.empty?
    stations.each_with_index do |s, i| puts "\t#{i + 1}. #{s.show_title.capitalize}."
    end
    puts '##################################'
    puts '######### Trains List ############'
    puts "\t!!EMPTY!!" if trains.empty?
    trains.each_with_index do |t, i| puts "\t#{i + 1}. #{t.type.to_s.capitalize} train, number #{t.number}, location - #{t.current_station.title.to_s}"
    end
  end
end
