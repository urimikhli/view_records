require 'spec_helper'
require './data_record'
require './data_record_list'

describe DataRecordList do
  
  let(:recordList) { DataRecordList.new }
  let(:list) { Array.new }

  it "should return blank list" do
    expect(recordList.record_list).to eq []
  end
  
  describe ".append" do
    before do
      recordList.append(DataRecord.new("Bonk | Radek | S | M | Green | 6-3-1975")) 
    end

    it "should add the record to DataRecordList" do
      expect(recordList.record_list.size).to eq 1
    end
    
  end
  describe ".output_records" do
    before do
      recordList.append(DataRecord.new("Bonk | Radek | S | M | Green | 6-3-1975"))
      recordList.append(DataRecord.new("Kournikova Anna F F 6-3-1975 Red"))
      recordList.append(DataRecord.new("Abercrombie, Neil, Male, Tan, 2/13/1943"))
    end

    context "sort by gender" do
      before do
        recordList.output_records("gender")
      end
      it "should show the Female record first" do
        expect(recordList.record_list.first.firstName).to eq "Anna"
      end 
    end

    context "sort by birthdate" do
      before do
        recordList.output_records("birthdate")
      end
      it "should show the oldest birthday first" do
        expect(recordList.record_list.first.dateOfBirth).to eq "2/13/1943"
      end 
    end

    context "sort by lastname" do
      before do
        recordList.output_records("birthdate")
      end
      it "should show Abercrombie last name first" do
        expect(recordList.record_list.first.lastName).to eq "Abercrombie"
      end 
    end

  end
end
