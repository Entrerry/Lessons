require_relative 'modules'

class RailwayCarriage
  include Manufacturer
  attr_reader :type
  
  def initialize
    @type = nil
  end
end
