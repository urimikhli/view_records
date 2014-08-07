class DataRecord
  attr_accessor :lastName, :firstName, :middleInitial, :gender, :favoriteColor, :dateOfBirth

  def initialize(line =nil)
    return unless line
    getRecord(line)
  end

  def to_s
    puts "#{lastName}, #{firstName}, #{middleInitial}, #{gender}, #{favoriteColor}, #{dateOfBirth}"
  end

  def to_a
    [lastName, firstName, middleInitial, gender, favoriteColor, dateOfBirth]
  end

  private

  def getRecord(line)
  	if (line =~ /\|/)
			pipeDelimited(line) 
		elsif  (line =~ /,/)
			commaDelimited(line) 
		else
			spaceDelimited(line)
		end

#    #convert M to Male and F to Female
#		convertGender
#		#convert Dates to MMDDYYYY
#		convertDate

  end

	def pipeDelimited(line)
		@lastName, @firstName, @middleInitial, @gender, @favoriteColor, @dateOfBirth = line.split(" | ")
	end

	def spaceDelimited(line)
		@lastName, @firstName, @middleInitial, @gender, @dateOfBirth, @favoriteColor = line.split(" ")
	end

	def commaDelimited(line)
		@middleInitial = "" # for consistancy
		@lastName, @firstName, @gender, @favoriteColor, @dateOfBirth = line.split(", ")
	end

#	def convertGender
#		#convert M to Male and F to Female
#		if (@Gender =~ /^F$/)
#			@Gender = "Female"
#		elsif  (@Gender =~ /^M$/)
#			@Gender = "Male"
#		end
#	end

#	def convertDate
#		#match '-' and '/' delimited mmddyyy formats and force them to mm/dd/yyyy format.
#		# to make this faster replace (-|\/) with (-) 
#		# just to match the bad formats and leave the correct ones alone
#	  @DateOfBirth.sub!(/((1[0-2]|0?[1-9]))(-|\/)(3[01]|[12][0-9]|0?[1-9])(-|\/)((?:[0-9]{2})?[0-9]{2})/, '\1/\4/\6')
#	end



end
