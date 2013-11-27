class AddTypeToAnsers < ActiveRecord::Migration
  def change
    add_column :answers, :answer_type, :string
    add_column :answers, :response_index, :integer
  end
end
