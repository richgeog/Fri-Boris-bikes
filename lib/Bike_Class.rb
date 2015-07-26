class Bike

  def initialize
    @working = true
  end

  def working?
    @working == true
  end

  def report_broken
    @working = nil
  end

  def broken?
    !@working == true
  end

end