class AddAttendanceStatusToAttendance < ActiveRecord::Migration
  def change
    add_column :attendances, :attendance_status, :integer
  end
end
