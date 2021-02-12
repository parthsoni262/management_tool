module EmailModule
  REGEX_PATTERN = /^[A-Za-z0-9+_.-]+@[A-Za-z0-9.-]+$/ 
  def check_email(email=nil)
    ((email =~REGEX_PATTERN) == 0) ? true : false 
  end
  REGEX = /^(?:\+?\d{1,3}\s*-?)?\(?(?:\d{3})?\)?[- ]?\d{3}[- ]?\d{4}$/
  def check_contact (contact_no=nil)
    ((contact_no =~REGEX) == 0) ? true : false
  end
end