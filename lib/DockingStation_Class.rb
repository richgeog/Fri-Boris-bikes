require_relative 'Bike_Class'

class DockingStation

  attr_accessor :capacity

  def initialize capacity
    @capacity = capacity
  end

  DEFAULT_CAPACITY = 20

  def initialize
    @bikes = []
    @capacity = DEFAULT_CAPACITY
  end

  def release_bike
    fail 'No bikes available' if empty?

    if @bikes.any?{ |bike| bike.working? == true }
      position = @bikes.index { |bike| bike.working? == true }
      @bikes.slice!(position)
    else
      fail 'No working bikes available'
    end
  end

  def dock (bike)
    fail 'Docking Station full' if full?
    @bikes << bike
  end

  private

  attr_reader :bikes

  def full?
    @bikes.count >= capacity
  end

  def empty?
    @bikes.empty?
  end

end