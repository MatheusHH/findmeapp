class AddScheduleToBooks < ActiveRecord::Migration[5.2]
  def change
    add_column :books, :schedule, :datetime
  end
end
