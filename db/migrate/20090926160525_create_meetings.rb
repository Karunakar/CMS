class CreateMeetings < ActiveRecord::Migration
  def self.up
    create_table :meetings do |t|
      t.string :title
      t.datetime :meeting_date
      t.string :venue
      t.time :start_time
      t.time :finish_time
      t.string :type
      t.integer :project_id
      t.string :participants

      t.timestamps
    end
  end

  def self.down
    drop_table :meetings
  end
end
