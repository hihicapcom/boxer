class Analysis < ActiveRecord::Base
  belongs_to :demand
  has_many :designs
  has_many :tasks
  has_one :user
end
