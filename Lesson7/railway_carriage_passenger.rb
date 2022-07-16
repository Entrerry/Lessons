class PassengerRailwayCarriage < RailwayCarriage
  def initialize(places)
    super
    @places = places
    @occupied_places = 0
    @type = :passenger
  end

  def empty_volume # кол-во свободных мест в вагоне
    @places
  end

  def filled_volume # кол-во занятых мест в вагоне
    @occupied_places
  end

  def get_place # "занимает места" в вагоне (по одному за раз)
    @places -= 1
    @occupied_places += 1
  end

  def show_type
    @type
  end
end
