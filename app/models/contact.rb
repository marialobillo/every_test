class Contact < ActiveRecord::Base

  validates :firstname, :presence => true
  validates :lastname, :presence => true
  validates :email, :presence => true

  has_many :phones
end
