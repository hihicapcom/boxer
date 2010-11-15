class AddFrequencies < ActiveRecord::Migration
  def self.up
    Frequency.create :name=>'总是', :description=>''
    Frequency.create :name=>'经常', :description=>''
    Frequency.create :name=>'偶尔', :description=>''
  end

  def self.down
    Frequency.find_all_by_name('总是').destroy
    Frequency.find_all_by_name('经常').destroy
    Frequency.find_all_by_name('偶尔').destroy
  end
end
