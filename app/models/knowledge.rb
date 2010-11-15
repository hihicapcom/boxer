class Knowledge < ActiveRecord::Base
  belongs_to :user
  belongs_to :project
  has_many :docs
  has_one :category

  validates_presence_of :title
  validates_length_of :content, :maximum=>20000
  validates_length_of :analysis, :maximum=>20000
  validates_length_of :knowledge, :maximum=>20000
  validates_length_of :reference, :maximum=>20000
end
