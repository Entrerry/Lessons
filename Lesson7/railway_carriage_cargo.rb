class CargoRailwayCarriage < RailwayCarriage
  def initialize(volume)
    super
    @volume = volume
    @filled_volume = 0
    @type = :cargo
  end

  def empty_volume # возвращает оставшийся (доступный) объем
    @volume
  end

  def filled_volume # возвращает занятый объем
    @filled_volume
  end

  def fill_volume(size) # "занимает объем" в вагоне
    @volume -= size
    @filled_volume += size
  end

  def show_type
    @type
  end
end
