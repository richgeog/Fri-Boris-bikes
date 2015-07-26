require 'DockingStation_Class'

describe DockingStation do
    it 'has a default capacity currently set at 20 bikes' do
      expect(subject.capacity).to eq DockingStation::DEFAULT_CAPACITY
    end

    it { is_expected.to respond_to(:dock).with(1).argument }

    describe '#dock' do
      it 'raises an error when the docking station is full' do
        subject.capacity.times { subject.dock double :bike }
        expect { subject.dock double :bike }.to raise_error 'Docking Station full'
      end
    end

    it { is_expected.to respond_to :release_bike }

    it 'releases a bike after it has been docked' do
      subject.dock(Bike.new)
      expect(subject.release_bike).to be_instance_of Bike
    end

    it 'releases a working bike from the docking station' do
      bike = double :bike, working?: true
      subject.dock bike
      expect(subject.release_bike).to be bike
  end

    describe '#release_bike' do
      it 'raises an error when there are no bikes available in the dock' do
        expect { subject.release_bike }.to raise_error 'No bikes available'
      end

      it "raises an error when there are no working bikes available in the dock" do
        subject.dock double :bike, working?: false
        expect { subject.release_bike }.to raise_error "No working bikes available"
      end
    end

    context 'when a mixture of working bikes and broken bikes are docked' do
      station = DockingStation.new

      i = 1
      until i == 3 do
        station.dock Bike.new

        bike = Bike.new
        bike.report_broken
        station.dock bike
        i += 1
      end

    describe "#release_bike" do
      it 'releases all working bikes first. But will not release any bikes that are broken' do
        expect(station.release_bike).to be_working
        expect(station.release_bike).to be_working
        expect{station.release_bike}.to raise_error("No working bikes available")
      end
    end
  end

end