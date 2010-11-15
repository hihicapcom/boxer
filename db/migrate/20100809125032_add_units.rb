class AddUnits < ActiveRecord::Migration
  def self.up
    Unit.create :name=>'退税认定'
    Unit.create :name=>'退税申报'
    Unit.create :name=>'退税审核'
    Unit.create :name=>'退税审批'
    Unit.create :name=>'日常管理'
    Unit.create :name=>'数据管理'

  end

  def self.down
    Unit.find_all_by_name('退税认定').destroy
    Unit.find_all_by_name('退税申报').destroy
    Unit.find_all_by_name('退税审核').destroy
    Unit.find_all_by_name('退税审批').destroy
    Unit.find_all_by_name('日常管理').destroy
    Unit.find_all_by_name('数据管理').destroy

  end
end
