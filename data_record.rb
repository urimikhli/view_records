class DataRecord
  attr_accessor :last_name, :first_name, :middle_initial, :gender, :favorite_color, :date_of_birth

  def initialize(line =nil)
    return unless line
    get_record(line)
  end

 	def record_output
		"#{last_name} #{first_name} #{gender} #{birthday} #{favorite_color}"
	end

  private

  def get_record(line)
    if (line =~ /\|/)
      pipe_delimited(line) 
    elsif  (line =~ /,/)
      comma_delimited(line) 
    else
      space_delimited(line)
    end
    spell_out_gender
    consistent_birthdate
  end

	def pipe_delimited(line)
		@last_name, @first_name, @middle_initial, @gender, @favorite_color, @date_of_birth = line.split(" | ")
	end

	def space_delimited(line)
		@last_name, @first_name, @middle_initial, @gender, @date_of_birth, @favorite_color = line.split(" ")
	end

	def comma_delimited(line)
		@middle_initial = "" # for consistancy
		@last_name, @first_name, @gender, @favorite_color, @date_of_birth = line.split(", ")
	end

  def spell_out_gender
    if (@gender =~ /^F$/)
      @gender = "Female"
    elsif  (@gender =~ /^M$/)
      @gender = "Male"
    end
  end

  def consistent_birthdate
    m,d,y = @date_of_birth.sub!(/((1[0-2]|0?[1-9]))(-|\/)(3[01]|[12][0-9]|0?[1-9])(-|\/)((?:[0-9]{2})?[0-9]{2})/, '\1/\4/\6').split("/")
    @date_of_birth=Time.new(y,m,d)
  end

  def birthday
    "#{date_of_birth.month}/#{date_of_birth.day}/#{date_of_birth.year}"
  end



end
