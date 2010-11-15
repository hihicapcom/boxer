class Implement < ActiveRecord::Base
  belongs_to :task
  has_one :user
  has_one :state
end
