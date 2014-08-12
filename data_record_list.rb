
class DataRecordList
  attr_accessor :record_list

  def initialize
 		@record_list = Array.new
  end

	def output_records(sort_by = "")
    if sort_by.eql? "gender"
      sort_by_gender_lastname
    elsif sort_by.eql? "birthdate"
      sort_by_birthdate_lastname
    elsif sort_by.eql? "lastname"
      sort_by_lastname
    end
		@record_list.map { | record | record.record_output }
	end

  def append(dataRecord)
    @record_list.push(dataRecord)
  end

  private
  
  def sort_by_gender_lastname
    @record_list.sort!{|x,y| [x.gender,x.last_name] <=> [y.gender,y.last_name] }
  end

  def sort_by_birthdate_lastname
    @record_list.sort! do  |x,y| 
			xm,xd,xy = x.date_of_birth.split("/") 
			ym,yd,yy =y.date_of_birth.split("/")
			[xy,xm,xd,x.last_name] <=> [yy,ym,yd,y.last_name]
		end
  end

  def sort_by_lastname
    @record_list.sort!{|y,x| x.last_name <=> y.last_name }
  end

end
