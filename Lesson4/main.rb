require_relative 'train'
require_relative 'train_passenger'
require_relative 'train_cargo'
require_relative 'station'
require_relative 'route'
require_relative 'railway_carriage'
require_relative 'railway_carriage_passenger'
require_relative 'railway_carriage_cargo'
require_relative 'ui'

interface = Interface.new

loop do
  interface.run
end
