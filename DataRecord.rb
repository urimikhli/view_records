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

1;
