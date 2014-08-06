
#ruby record_merg.rb pipe.txt comma.txt space.txt

class DataRecord

 	attr_reader :LastName, :FirstName, :MiddleInitial, :Gender, :FavoriteColor, :DateOfBirth
 	attr_writer :LastName, :FirstName, :MiddleInitial, :Gender, :FavoriteColor, :DateOfBirth


	def pipeDelimited(line)
		@LastName, @FirstName, @MiddleInitial, @Gender, @FavoriteColor, @DateOfBirth = line.split(" | ")
	end

	def spaceDelimited(line)
		@LastName, @FirstName, @MiddleInitial, @Gender, @DateOfBirth, @FavoriteColor = line.split(" ")
	end

	def commaDelimited(line)
		@MiddleInitial = "" # for consistancy
		@LastName, @FirstName, @Gender, @FavoriteColor, @DateOfBirth = line.split(", ")
	end

	def convertGender
		#convert M to Male and F to Female
		if (@Gender =~ /^F$/)
			@Gender = "Female"
		elsif  (@Gender =~ /^M$/)
			@Gender = "Male"
		end
	end

	def convertDate
		#match '-' and '/' delimited mmddyyy formats and force them to mm/dd/yyyy format.
		# to make this faster replace (-|\/) with (-) 
		# just to match the bad formats and leave the correct ones alone
	        @DateOfBirth.sub!(/((1[0-2]|0?[1-9]))(-|\/)(3[01]|[12][0-9]|0?[1-9])(-|\/)((?:[0-9]{2})?[0-9]{2})/, '\1/\4/\6')
	end

	def slurpLine(line)
		# based on the delimiter read the line and convert to a DataRecord
        	if (line =~ /\|/)
			pipeDelimited(line) 
		elsif  (line =~ /,/)
			commaDelimited(line) 
		else
			spaceDelimited(line)
		end 
		# Some fields need to be changed to be consistent and for correct output.
		processRecords
	end

	def processRecords
		#this is just a place holder method for record field processing
		#

		#convert M to Male and F to Female
		convertGender
		#convert Dates to MMDDYYYY
		convertDate
	
	end

	def record_output 
		#format of the record output
		return "#{@LastName} #{@FirstName} #{@Gender} #{@DateOfBirth} #{@FavoriteColor}"
	end

end

class DataRecordsList
 	def initialize
 		@records = Array.new
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
		puts  "Output 1:"
		@records.each { | l | puts l.record_output }
 	end

  	def output2
		#  Output 2  sorted by birth date, ascending.  
		#  added a last name secondary sort to make it the same as the sample solution
		@records.sort! do  |x,y| 
			mx,dx,yx = x.DateOfBirth.split("/") 
			ym,yd,yy =y.DateOfBirth.split("/")
			[yx,mx,dx,x.LastName] <=> [yy,ym,yd,y.LastName]
		end
		puts  "\nOutput 2:"
		@records.each { | l | puts l.record_output }
	end

	def output3
		# Output 3  sorted by last name, descending.
		@records.sort!{|y,x| x.LastName <=> y.LastName }
		puts  "\nOutput 3:"
		@records.each { | l | puts l.record_output }
	end
  
end

recordList = DataRecordsList.new()
ARGF.each { |line| 
	line.chomp!
	dataRecords = DataRecord.new()
	dataRecords.slurpLine(line)
	recordList.append(dataRecords)

}
recordList.output1
recordList.output2
recordList.output3


