require 'digest'

class User < ActiveRecord::Base
  attr_protected :hashed_password, :enabled
  attr_accessor :password, :password_confirmation
  belongs_to :project
  belongs_to :user
  belongs_to :analysis
  belongs_to :design
  belongs_to :implement
  belongs_to :knowledge
  belongs_to :doc
  belongs_to :bug


  validates_presence_of :name
  validates_presence_of :email
  validates_length_of :name, :within=>3..64
  validates_length_of :email, :within=>5..128
  validates_length_of :telephone, :maximum =>50
  validates_length_of :department, :maximum =>200
  validates_length_of :post, :maximum=>6
  validates_uniqueness_of :name
  validates_uniqueness_of :email
  validates_length_of :password, :within=>4..20, :if => :password_required?

  def before_save
    self.hashed_password = User.encrypt(password) if !self.password.blank?
  end

  def password_required?
    self.hashed_password.blank?||!self.password.blank?
  end

  def self.encrypt(string)
    return Digest::SHA256.hexdigest(string)
  end

  def self.authenticate(username, password)
    find_by_name_and_hashed_password_and_enabled(username, User.encrypt(password), true);
  end


end
