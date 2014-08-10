
class DataRecordList
  attr_accessor :record_list

  def initialize
 		@record_list = Array.new
  end

	def output_records(sort_by)
    if sort_by.eql? "gender"
      sort_by_gender_lastname
    elsif sort_by.eql? "birthdate"
      sort_by_birthdate_lastname
    elsif sort_by.eql? "lastname"
      sort_by_lastname
    end
		@record_list.map { | record | puts record.record_output }
	end

  def append(dataRecord)
    @record_list.push(dataRecord)
  end

  private
  
  def sort_by_gender_lastname
    @record_list.sort!{|x,y| [x.gender,x.lastName] <=> [y.gender,y.lastName] }
  end

  def sort_by_birthdate_lastname
    @record_list.sort! do  |x,y| 
			xm,xd,xy = x.dateOfBirth.split("/") 
			ym,yd,yy =y.dateOfBirth.split("/")
			[xy,xm,xd,x.lastName] <=> [yy,ym,yd,y.lastName]
		end
  end

  def sort_by_lastname
    @record_list.sort!{|y,x| x.lastName <=> y.lastName }
  end

end
