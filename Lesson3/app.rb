class Station
  def initialize(title)
    @trains_on_station = {} # - Сбда должны попадать {тип поезда => номер поезда}
    @title = title
  end

  def get_train # - эта функция как будто бы пересекается с функцией из 91 строки, не понимаю как их скомпановать
  end

  def show_trains_all
    puts trains_on_station
  end

  def show_trains_type # - тут значения хэша из строки 3 в зависимости от выбраного ключа (freight train или passenger train)
  end

  def send_train # - не понимаю пока, как реализовать отправку
  end
end

class Route
  def initialize(first, last)
    @first = first
    @last = last
    @route = [first, last]
  end

  def add_station
    puts 'Which station will be added to the route?'
    answer = gets.chomp
    @route.insert(1, "#{answer}")
  end

  def delete_station
    puts 'Which station will be deleted from the route?'
    answer = gets.chomp
    @route.delete("#{answer}")

  end

  def show_route
    @route.each do |title|
      #puts "#{title.capitalize}."
    end
  end
end

class Train
  def initialize(number, type, railway_carriage_count)
    #@location = :depot
    @speed = 0
    @railway_carriage_count = railway_carriage_count
    @number = number
    @type = type
    puts "We have train num. #{number}. Type is #{type}. And the train has #{railway_carriage_count} railway carriages."
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

  def change_railway_carriage_count
    print "We gonna (add) or (delete) railway carriage? "
    answer = gets.chomp
    if @speed > 0
      puts "We cannot change count of railway carriage until train stops!"
    elsif answer == 'add'
      @railway_carriage_count += 1 if @speed == 0
    elsif answer == 'delete'
      @railway_carriage_count -= 1 if @speed == 0
    else
      puts 'I do not understand you!'
    end
  end

  def get_route #если я верно понимаю, изначально у нас поезд нигде не находится. Первым делом мы придумываем какой-то мршрут, потом расставляем на нём станции и только потом создаём поезда.
  end

  def move #в одной этой функции, в зависимости от gets, планировал реализовать движение вперёд или назад
  end

  def show_location
  end
end

route = Route.new('Depot', 'Moscow')
puts route.show_route

puts ' '
train1 = Train.new(666, 'passenger train', 5)
#train1.show_location
train1.show_speed
puts ' '
train2 = Train.new(667, 'freight train', 20)
#train2.show_location
train2.show_speed
puts ' '


