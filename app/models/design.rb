class Design < ActiveRecord::Base
  belongs_to :analysis
  has_many :tasks
  has_one :user

  validates_presence_of :title
  validates_presence_of :keyword
  validates_length_of :plan, :maximum=>20000
  validates_length_of :stepes, :maximum=>20000
end
