require_relative 'spec_helper.rb'

describe Robot do |variable|
  before :each do
    @robot = Robot.new
    @item = Item.new("hello",9)
    @robot.health = 0
  end

  describe "#heal!" do
    it "should give error if the health is already 0" do

      expect{@robot.wound(100)}.to raise_error
    end
  end

  describe "#attack" do
    it "should give error if not attacking robot" do
      expect{@robot.attack(@item)}.to raise_error
    end
  end

end

