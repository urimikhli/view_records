##Sample use of DataRecord and DataRecord Classes
#

require './data_record'
require './data_record_list'

recordList = DataRecordList.new
ARGF.each do |line| 
	line.chomp!
	recordList.append(DataRecord.new(line))
end

puts "Sort by gender:"
puts recordList.output_records("gender")

puts "\nSort by birthday:"
puts recordList.output_records("birthdate")

puts "\nSort by lastname:"
puts recordList.output_records("lastname")

