module Manufacturer
  def set_manufacturer(title)
    @title = title
  end

  def show_manufacturer
    @title
  end

  private
  
  attr_accessor :title
end

module InstanceCounter
  @@instances = 0
  
  def instances # возвращает кол-во экземпляров класса
    @@instances
  end

  def register_instance # увеличивает счетчик кол-ва экземпляров класса
    @@instances += 1
  end
end
