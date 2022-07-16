require_relative 'modules'

class RailwayCarriage
  include Manufacturer
  attr_reader :type
  
  def initialize(available_space)
    @available_space = available_space
    @type = nil
  end
end
