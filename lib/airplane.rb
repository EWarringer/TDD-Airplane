class Airplane
  attr_reader :type, :wing, :horsepower
  attr_accessor :engine_on, :flying, :fuel
  def initialize(type, wing, horsepower)
    @type = type
    @wing = wing
    @horsepower = horsepower
    @engine_on = false
    @flying = false
    @fuel = 100
  end

  # Plane starts if not already on
  def start
    if @engine_on == false
      @engine_on = true
      @fuel -= 5
      return "airplane started"
    else
      return "airplane already started"
    end
  end

  # Plane takes off only if currently on ground with engine on
  def takeoff
    if @engine_on == false
      return "airplane not started, please start"
    elsif @engine_on == true && @flying == false
      @flying = true
      @fuel -= 15
      return "airplane launched"
    else
      return "airplane already flying"
    end
  end

  # Plane lands only if currently in air
  def land
    if @engine_on == false
      return "airplane not started, please start"
    elsif @engine_on == true && @flying == false
      return "airplane already on the ground"
    else
      @flying = false
      @engine = false
      @fuel -= 10
      return "airplane landed"
    end
  end

  #tank refills only if currently grounded
  def refill
    if @flying == false
      @fuel = 100
      return "tank refilled"
    else
      return "you must wait until grounded to fill tank"
    end
  end
end
