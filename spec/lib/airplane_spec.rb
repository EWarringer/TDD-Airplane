# Test file for Airplane class

require_relative "../../lib/airplane"

describe Airplane do
  let(:my_plane) {Airplane.new("cesna", 10, 150)}

  #Initialization tests
  describe "#initialization" do
    it 'has a type' do
      expect(my_plane.type).to eq("cesna")
    end

    it "has a wing loading" do
      expect(my_plane.wing).to eq(10)
    end

    it "has a horsepower" do
      expect(my_plane.horsepower).to eq(150)
    end

    it "starts with the engine off" do
      expect(my_plane.engine_on).to eq(false)
    end

    it "starts on the ground" do
      expect(my_plane.flying).to eq(false)
    end

    it "starts with a full tank of 100" do
      expect(my_plane.fuel).to eq(100)
    end
  end

  #Plane start tests
  describe "#start" do
    it "just started" do
      expect(my_plane.start).to eq("airplane started")
    end

    it "was already running" do
      my_plane.start
      expect(my_plane.start).to eq("airplane already started")
    end
  end

  # Takeoff tests
  describe "#takeoff" do
    it "needs to be started before takeoff" do
      expect(my_plane.takeoff).to eq("airplane not started, please start")
    end

    it "launches if already started" do
      my_plane.start
      expect(my_plane.takeoff).to eq("airplane launched")
    end
  end

  # Landing tests
  describe "#land" do
    it "has not has not been started yet" do
      expect(my_plane.land).to eq("airplane not started, please start")
    end

    it "is started and is on the ground" do
      my_plane.start
      expect(my_plane.land).to eq("airplane already on the ground")
    end

    it "good to land" do
      my_plane.start
      my_plane.takeoff
      expect(my_plane.land).to eq("airplane landed")
    end
  end

  # Fuel tests
  describe "#fuel" do
    it "uses gas to start plane" do
      my_plane.start
      expect(my_plane.fuel).to eq(95)
    end

    it "uses gas to take off" do
      my_plane.start
      my_plane.takeoff
      expect(my_plane.fuel).to eq(80)
    end

    it "uses gas to land" do
      my_plane.start
      my_plane.takeoff
      my_plane.land
      expect(my_plane.fuel).to eq(70)
    end
  end

  # Refill fuel tests
  describe "#refill" do
    it "is refilled" do
      my_plane.start
      my_plane.refill
      expect(my_plane.fuel).to eq(100)
    end
    it "cannot be refilled because plane is in the air" do
      my_plane.start
      my_plane.takeoff
      expect(my_plane.refill).to eq("you must wait until grounded to fill tank")
    end
  end
end
