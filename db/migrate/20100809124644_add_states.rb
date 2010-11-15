class AddStates < ActiveRecord::Migration
  def self.up
    State.create :name=>'10%'
    State.create :name=>'20%'
    State.create :name=>'30%'
    State.create :name=>'40%'
    State.create :name=>'50%'
    State.create :name=>'60%'
    State.create :name=>'70%'
    State.create :name=>'80%'
    State.create :name=>'90%'
    State.create :name=>'100%'
  end

  def self.down
    State.find_all_by_name('10%').destroy
    State.find_all_by_name('20%').destroy
    State.find_all_by_name('30%').destroy
    State.find_all_by_name('40%').destroy
    State.find_all_by_name('50%').destroy
    State.find_all_by_name('60%').destroy
    State.find_all_by_name('70%').destroy
    State.find_all_by_name('80%').destroy
    State.find_all_by_name('90%').destroy
    State.find_all_by_name('100%').destroy
  end
end
