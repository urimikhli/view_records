require 'spec_helper'

describe "manage records" do

  context "Initializing the records by reading the files" do
    before do
      records = DataRecords.new()
    end
    it "should instantiate a class instance with the records we want" do
      records.should respond_to to_s
    end
  end
end

