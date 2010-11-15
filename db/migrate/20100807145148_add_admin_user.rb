class AddAdminUser < ActiveRecord::Migration
  def self.up
    User.create(:name => 'Admin',
                :realname=>'管理员',
                :email =>'admin@railscoders.net',
                :telephone =>'1234567898',
                :department=>'税务研发',
                :post=>'210000',
                :password => 'admin', :password_confirmation =>'admin')
  end

  def self.down
    User.find_by_name('Admin').destory
  end
end
