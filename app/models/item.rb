class Item < ActiveRecord::Base
  belongs_to :beacon
  has_many :notes
end
