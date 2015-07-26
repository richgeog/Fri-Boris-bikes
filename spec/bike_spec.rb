require 'Bike_Class'

describe Bike do
  it { is_expected.to respond_to(:working?) }

  it 'can be reported broken' do
    subject.report_broken
    expect(subject).to be_broken
  end

  it "can't be broken and working at the sametime" do
    subject.report_broken
    expect(subject).to_not be_working
  end

end