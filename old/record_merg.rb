
#command line call
#ruby record_merg.rb -based=/cygdrive/c/Sites/ pipe.txt comma.txt space.txt

#start with a base line path
#
#
#based=undef

#basedir = based ? based : "" #default is the files are in the same place.



class DataRecord

 	attr_reader :LastName, :FirstName, :MiddleInitial, :Gender, :FavoriteColor, :DateOfBirth
 	attr_writer :LastName, :FirstName, :MiddleInitial, :Gender, :FavoriteColor, :DateOfBirth


	def pipeDelimited(line)
		@LastName, @FirstName, @MiddleInitial, @Gender, @FavoriteColor, @DateOfBirth = (line.to_s).split(" | ")
	end
	def spaceDelimited(line)
		@LastName, @FirstName, @MiddleInitial, @Gender, @DateOfBirth, @FavoriteColor = line.split(" ")
	end
	def commaDelimited(line)
		@MiddleInitial = "" # for consistancy
		@LastName, @FirstName, @Gender, @FavoriteColor, @DateOfBirth = line.split(", ")
	end

	def convertGender
		if (@Gender =~ /^F$/)
			@Gender = "Female"
		elsif  (@Gender =~ /^M$/)
			@Gender = "Male"
		end
	end

	def convertDate
		#match '-' and '/' delimited mmddyyy formats and force them to mm/dd/yyyy format.
	        @DateOfBirth.sub!(/((1[0-2]|0?[1-9]))(-|\/)(3[01]|[12][0-9]|0?[1-9])(-|\/)((?:[0-9]{2})?[0-9]{2})/, '\1/\4/\6')
	end

	def slurpLine(line)
        	if (line =~ /\|/)
			pipeDelimited(line) 
		elsif  (line =~ /,/)
			commaDelimited(line) 
		else
			spaceDelimited(line)
		end 
	end
	def processRecords
		#convert M to Male and F to Female
		convertGender
		#convert Dates to MMDDYYYY
		convertDate
	
	end

	def to_s 
		return "#{@LastName} #{@FirstName} #{@Gender} #{@DateOfBirth} #{@FavoriteColor}"

	end

end

recordList= Array.new()
ARGF.each { |line| 
	line.chomp!
	dataRecord = DataRecord.new()
	dataRecord.slurpLine(line)
	dataRecord.processRecords()
	recordList.push(dataRecord)

}

# Output 1  sorted by gender (females before males) then by last name ascending.
recordList.sort!{|x,y| [x.Gender,x.LastName] <=> [y.Gender,y.LastName] }

puts  "Output 1:"
recordList.each { | l | puts l.to_s }

#  Output 2  sorted by birth date, ascending.  
#  added a last name secondary sort to make it the same as the sample solution
recordList.sort! do  |x,y| 
	mx,dx,yx = x.DateOfBirth.split("/") 
	ym,yd,yy =y.DateOfBirth.split("/")
	[yx,mx,dx,x.LastName] <=> [yy,ym,yd,y.LastName]
end

puts  "\nOutput 2:"
recordList.each { | l | puts l.to_s }

# Output 3  sorted by last name, descending.
recordList.sort!{|y,x| x.LastName <=> y.LastName }

puts  "\nOutput 3:"
recordList.each { | l | puts l.to_s }

