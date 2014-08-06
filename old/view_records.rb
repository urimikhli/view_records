require 'DataRecord.rb'
require 'DataRecordsList.rb'

def SaveViewToFile(filehandle,recordList)
	
	filehandle.puts  recordList.output_title
	recordList.records.each {|x| filehandle.puts x.record_output}	
	
end

recordList = DataRecordsList.new()
ARGF.each { |line| 
	line.chomp!
	dataRecords = DataRecord.new()
	dataRecords.slurpLine(line)
	recordList.append(dataRecords)

}

filehandle = File.new("myOutput.txt","w")

#first set the view
#then Print to Screen
#then save the output to a file
#
recordList.output1
recordList.print_output
SaveViewToFile(filehandle,recordList)

recordList.output2
recordList.print_output
SaveViewToFile(filehandle,recordList)

recordList.output3
recordList.print_output
SaveViewToFile(filehandle,recordList)

filehandle.close()
