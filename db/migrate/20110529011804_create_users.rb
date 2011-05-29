class CreateUsers < ActiveRecord::Migration
  def self.up
    create_table :users do |t|
      t.string  :provider,  :null => false
      t.string  :uid,       :null => false
      t.string  :name,      :null => false, :uniq => true
      t.string  :icon,      :null => false
      t.boolean :activated, :default => false

      t.timestamps
    end

    add_index :users, [:provider, :uid]
    add_index :users, [:name]
  end

  def self.down
    drop_table :users
  end
end
