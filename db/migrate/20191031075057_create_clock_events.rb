class CreateClockEvents < ActiveRecord::Migration[5.2]
  def change
    create_table :clock_events do |t|
      t.belongs_to :user
      t.integer :event_type, :limit => 1, :comment => '1:school, 2:lunch, 3:personal'
      t.integer :event_action, :limit => 1, :comment => '1:clock_in, 2:clock_out'
      t.string :event_reason
      t.datetime :event_time
      t.string :created_by
      t.string :updated_by
      t.string :deleted_by
      t.datetime :created_at, null: false
      t.datetime :updated_at, null: false
      t.datetime :deleted_at
    end
  end
end
