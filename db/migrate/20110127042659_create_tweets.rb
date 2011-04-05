class CreateTweets < ActiveRecord::Migration
  drop_table :tweets
  def self.up
    create_table :tweets do |t|
      t.string :message
      t.string :location

      t.timestamps
    end
  end

  def self.down
    drop_table :tweets
  end
end
