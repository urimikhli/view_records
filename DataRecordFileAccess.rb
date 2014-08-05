class DataRecordFileAccess

	attr_reader :file_handle
 	attr_writer :records
 	def initialize(filehandle)
 		@file_handle = filehandle
		@records = Array.new()
	end

	
end
1;
