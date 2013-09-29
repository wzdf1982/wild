class FixColumName < ActiveRecord::Migration
  def change
    rename_column :activities, :row_span, :column_span
  end
end
