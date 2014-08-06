class DataRecordsList
	attr_reader :records, :output_title
 	attr_writer :records, :output_title
 	def initialize
 		@records = Array.new
		@output_title = "Output"
  	end

  	def append(dataRecords)
    		@records.push(dataRecords)
    		self
  	end

  	def deleteFirst
    		@records.shift
  	end

  	def deleteLast
    		@records.pop
  	end

 	def [](key)
    		return @records[key] if key.kind_of?(Integer) # the usual find by index
    		return @records.find { |dataRecords| dataRecords.LastName == key }  # find records by last name
  	end

 	def output1
		## Output 1  sorted by gender (females before males) then by last name ascending.
		@records.sort!{|x,y| [x.Gender,x.LastName] <=> [y.Gender,y.LastName] }
		@output_title =  "Output 1:"
		#@records.each { | l | puts l.record_output }
 	end

  	def output2
		#  Output 2  sorted by birth date, ascending.  
		#  added a last name secondary sort to make it the same as the sample solution
		@records.sort! do  |x,y| 
			mx,dx,yx = x.DateOfBirth.split("/") 
			ym,yd,yy =y.DateOfBirth.split("/")
			[yx,mx,dx,x.LastName] <=> [yy,ym,yd,y.LastName]
		end
		@output_title =  "\nOutput 2:"
		#@records.each { | l | puts l.record_output }
	end

	def output3
		# Output 3  sorted by last name, descending.
		@records.sort!{|y,x| x.LastName <=> y.LastName }
		@output_title =  "\nOutput 3:"
		#@records.each { | l | puts l.record_output }
	end

	def print_output
		#print the title followed by the list
		puts @output_title
		@records.each { | l | puts l.record_output }
	end
  
end
1;
