class State < ActiveRecord::Base

  belongs_to :implement

  validates_presence_of :name
  validates_length_of :name, :maximum=>200
end
