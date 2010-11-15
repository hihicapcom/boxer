class AddSeverities < ActiveRecord::Migration
  def self.up
    Severity.create :name=>'严重', :description=>''
    Severity.create :name=>'一般', :description=>''
    Severity.create :name=>'轻微', :description=>''
    Severity.create :name=>'建议', :description=>''
  end

  def self.down
    Severity.find_all_by_name('严重').destroy
    Severity.find_all_by_name('一般').destroy
    Severity.find_all_by_name('轻微').destroy
    Severity.find_all_by_name('建议').destroy
  end
end
