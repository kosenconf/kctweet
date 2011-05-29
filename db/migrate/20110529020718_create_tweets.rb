class CreateTweets < ActiveRecord::Migration
  def self.up
    create_table :tweets do |t|
      t.integer :user_id, :null => false
      t.string  :message, :null => false

      t.timestamps
    end
  end

  def self.down
    drop_table :tweets
  end
end
