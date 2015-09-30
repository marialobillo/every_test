class Contact < ActiveRecord::Base

  validates :firstname, :presence => true
end
