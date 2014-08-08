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
    spell_out_gender
    consistent_birthdate
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

  def spell_out_gender
    if (@gender =~ /^F$/)
      @gender = "Female"
    elsif  (@gender =~ /^M$/)
      @gender = "Male"
    end
  end

  def consistent_birthdate
    @dateOfBirth.sub!(/((1[0-2]|0?[1-9]))(-|\/)(3[01]|[12][0-9]|0?[1-9])(-|\/)((?:[0-9]{2})?[0-9]{2})/, '\1/\4/\6')
  end



end
