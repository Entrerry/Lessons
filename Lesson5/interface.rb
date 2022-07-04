class Interface
  def initialize
    #@all_stations = []
    #@all_trains = []
    #@all_routes = []
  end

  def run
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
      when 1 then create_station
      when 2 then create_train
      when 3 then create_route
      when 4 then add_station_to_route
      when 5 then route_assign 
      when 6 then add_railway_carriages
      when 7 then remove_railway_carriages
      when 8 then move
      when 9 then show_list
    end
  end

  private

  def create_station
    print 'Enter station name: '
    name = gets.chomp
    puts "Station #{name} has been created!"
    Station.all << Station.new(name)
  end

  def create_train
    print 'Enter train number: '
    number = gets.chomp.to_i
    print 'Enter train type (passenger/cargo):'
    type = gets.chomp
    puts "#{type.capitalize} train, number #{number} has been created!"
    Train.all << CargoTrain.new(number) if type == 'cargo'
    Train.all << PassengerTrain.new(number) if type == 'passenger'
  end

  def create_route
    puts "We have #{Station.all.count} stations."
    Station.all.each_with_index do |s, i| puts "#{i + 1}. #{s.show_title.capitalize}"
    end
    print "Chose number of the first station: "
    start = gets.chomp.to_i
    print "Chose number of the last station: "
    finish = gets.chomp.to_i
    Route.all << Route.new(Station.all[start - 1], Station.all[finish - 1])
    puts "Route from #{Station.all[start - 1].show_title.capitalize} to #{Station.all[finish - 1].show_title.capitalize} has been created!"
  end

  def add_station_to_route
    puts "We have #{Station.all.count} stations."
    Station.all.each_with_index do |s, i| puts "#{i + 1}. #{s.show_title.capitalize}"
    end
    puts "And we have routes"
    Route.all.each_with_index do |r, i| puts "#{i + 1}. Route from #{r.first.show_title.capitalize} to #{r.last.show_title.capitalize}"
    end
    puts "Choose station: "
    answer = gets.chomp.to_i
    puts "Choose route: "
    answer2 = gets.chomp.to_i
    Route.all[answer2 - 1].add_station(Station.all[answer - 1]) 
  end

  def route_assign
    puts "We have #{Train.all.count} trains and #{Route.all.count} routes."
    puts "Choose the train, to assign the route."
    Train.all.each_with_index do |t, i| puts "#{i + 1}. #{t.type.to_s.capitalize} train, number #{t.number}"
    end
    answer1 = gets.chomp.to_i
    puts "Choose the route."
    Route.all.each_with_index do |r, i| puts "#{i + 1}. Route from #{r.first.show_title.capitalize} to #{r.last.show_title.capitalize}"
    end
    answer2 = gets.chomp.to_i
    Train.all[answer1 - 1].add_to_route(Route.all[answer2 - 1])
    puts "Route from #{Route.all[answer2 - 1].first.show_title.capitalize} to #{Route.all[answer2 - 1].last.show_title.capitalize} has been assign" + 'fоr' + "train number #{Train.all[answer1 - 1].number.to_s}"
  end

  def add_railway_carriages
    puts "Choose the train to add railway carriage."
    Train.all.each_with_index do |t, i| puts "#{i + 1}. #{t.type.to_s.capitalize} train, number #{t.number}"
    end
    answer = gets.chomp.to_i
    if Train.all[answer - 1].type == :cargo
      Train.all[answer - 1].add_railway_carriage(CargoRailwayCarriage.new)
    elsif Train.all[answer - 1].type == :passenger
      Train.all[answer - 1].add_railway_carriage(PassengerRailwayCarriage.new)
    end
    puts "Train number #{Train.all[answer - 1].number} now has #{Train.all[answer - 1].show_railway_carriage_count} railway carriages."
  end

  def remove_railway_carriages
    Train.all.each_with_index do |t, i| puts "#{i + 1}. #{t.type.to_s.capitalize} train, number #{t.number} with #{t.show_railway_carriage_count} railway carriages"
    end
    print "Choose the train to add railway carriage: "
    answer = gets.chomp.to_i
    Train.all[answer - 1].remove_railway_carriage(Train.all[answer - 1].railway_carriages[0])
  end

  def move
    Train.all.each_with_index do |t, i| puts "#{i + 1}. #{t.type.to_s.capitalize} train, number #{t.number}"
    end
    print "Choose the train to move: "
    answer = gets.chomp.to_i
    print "Press 1 to move forward or 2 to move backward:"
    dir = gets.chomp.to_i
    if dir == 1
      Train.all[answer - 1].move_forward
    elsif dir == 2
      Train.all[answer - 1].move_back
    end
  end

  def show_list
    puts '##################################'
    puts '######### Station List ###########'
    puts "\t!!EMPTY!!" if Station.all.empty?
      Station.all.each_with_index do |s, i| puts "\t#{i + 1}. #{s.show_title.capitalize}."
      end
    puts '##################################'
    puts '######### Trains List ############'
    puts "\t!!EMPTY!!" if Train.all.empty?
      Train.all.each_with_index do |t, i| puts "\t#{i + 1}. #{t.type.to_s.capitalize} train, number #{t.number}, location - #{t.current_station.title.to_s}"
      end
  end
end
