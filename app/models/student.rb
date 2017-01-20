class Student < ApplicationRecord
  has_many :courses, through: :enrollment
  has_many :assignments, through: :grades

  def self.search(search)
    if search
      find_by(:first_name, :conditions => ["first_name LIKE ?", "<%=#{search}%>"])
    else
      Student.all
    end
  end
  def self.with_unread_messages
    joins(:student).merge( Message.unread )
  end
end
