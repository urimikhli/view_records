require 'spec_helper'
require './data_record'

describe DataRecord do
  
  let(:record) { DataRecord.new("Bonk | Radek | S | M | Green | 6-3-1975") }
  context ".record_output" do
    before do
     # @record = DataRecord.new("Bonk | Radek | S | M | Green | 6-3-1975")
    end

    it "should instantiate a class instance with the records we want" do
      expect(record.record_output).to eq "Bonk Radek Male 6/3/1975 Green"
    end
  end
end
