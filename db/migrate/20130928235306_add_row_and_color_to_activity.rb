class AddRowAndColorToActivity < ActiveRecord::Migration
  def change
    add_column :activities, :row_span, :integer
    add_column :activities, :background_color, :string
  end
end
