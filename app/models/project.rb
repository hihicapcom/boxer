class Project < ActiveRecord::Base
  has_many:bugs
  has_many:modules
  has_many:demands
  has_many:knowledges
  has_many:docs

  has_one :user

  validates_presence_of :name
  validates_length_of :name, :maximum=>200
end
