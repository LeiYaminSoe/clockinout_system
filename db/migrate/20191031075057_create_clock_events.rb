class CreateClockEvents < ActiveRecord::Migration[5.2]
  def change
    create_table :clock_events do |t|
      t.belongs_to :user
      t.integer :event_type, :limit => 1, :comment => '1:school, 2:lunch, 3:personal'
      t.integer :event_action, :limit => 1, :comment => '1:clock_in, 2:clock_out'
      t.datetime :event_time
      t.timestamps
    end
  end
end
