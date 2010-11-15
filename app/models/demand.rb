class Demand < ActiveRecord::Base
  belongs_to :project
  has_many :analyses
  has_many :tasks
  has_one :user

  validates_presence_of :title, :message => "标题不能为空!"
  validates_presence_of :keyword, :message=>"关键字不能为空"
  validates_presence_of :department, :message=>"提出部门不能为空"
  validates_presence_of :businessman, :message=>"提出人不能为空"
  validates_presence_of :content,:message=>'需求内容不能为空'

  validates_length_of :title, :maximum=>200, :message=>'标题字数请控制在100中文字符内'
  validates_length_of :keyword, :maximum=>50, :message=>'关键字字数请控制在50中文字符内'
  validates_length_of :content, :maximum=>20000, :message=>'需求内容请控制在10000中文字符内'

end
