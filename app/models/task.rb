class Task < ActiveRecord::Base
  belongs_to :bug
  belongs_to :demand
  belongs_to :analysis
  belongs_to :design

  has_many :implements

  validates_presence_of :name
  validates_length_of :name, :maximum=>200

end
