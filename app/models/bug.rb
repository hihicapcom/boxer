class Bug < ActiveRecord::Base
  cattr_reader :per_page
  @@per_page = 10

  belongs_to :project
  has_many:tasks


  validates_presence_of :title
  validates_presence_of :keyword
  validates_presence_of :severity_id
  validates_presence_of :frequency_id
  validates_presence_of :unit_id
  validates_presence_of :state_id

  validates_length_of :title, :maximum =>200
  validates_length_of :keyword, :maximum=>50
  validates_length_of :content, :maximum=>20000
  validates_length_of :comment, :maximum=>20000

end
